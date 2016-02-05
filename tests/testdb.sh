#!/bin/sh

rm ~/.pgpass
touch ~/.pgpass
  
echo 'localhost:5432:testdb:testuser1:12345' >> ~/.pgpass
chmod 600 ~/.pgpass
  
psql -h localhost -d testdb -U testuser1 -c "CREATE TABLE testtable ( testfield varchar(100) );"
psql -h localhost -d testdb -U testuser1 -c "INSERT INTO testtable (testfield) VALUES ('foo');"
psql -h localhost -d testdb -U testuser1 -c "SELECT * FROM testtable;" \
     | grep -q 'foo' \
     && (echo 'Database test: pass' && exit 0) \
     || (echo 'Database test: fail' && exit 1)
