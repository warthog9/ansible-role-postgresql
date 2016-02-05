Ansible role - Postgresql database install role
=====
[![Build Status](https://travis-ci.org/repleo/ansible-role-postgresql.svg?branch=master)](https://travis-ci.org/repleo/ansible-role-postgresql)

This role installs and configures a postgresql server, or add new databases and user to an existing installation 

Requirements
------------

This role requires Ansible 1.4 or higher and platform requirements are listed in the metadata file.

Role Variables
--------------

The variables that can be passed to this role and a brief description about
them are as follows.

    databases:
      - name: database_name1
        users:
          - user: user_name1
            password: user_password
            privileges: ALL
            type: database
          - user: user_name2
            password: user_password
            privileges: ALL
            type: database
      - name: database_name2
        users:
         - user: user_name1
           password: user_password
           privileges: ALL
           type: database
   
Examples
========

1) Install postgresql without adding databases:

    - { role: repleo.postgresql  }

2) Install postgresql and add two databases:

    - { role: repleo.postgresql,
            databases: [
             { name: testdb1, users:[] },
             { name: testdb2, users:[] }
            ]
      }

3) Install postgresql, add two databases, and configure database users per database:

    - { role: repleo.postgresql,         
            databases: [
              { name: testdb,
                users: [
                  { user: testuser1,
                    password: 12345,
                    privileges: ALL,
                    type: database },
                  { user: testuser2,
                    password: 12345,
                    privileges: ALL,
                    type: database },
                ]
              }
            ]
      }
  
Dependencies
------------

None.

License
-------

GPL v3 - (c) 2016, Repleo, Amstelveen

Author Information
------------------

Repleo, Amstelveen, Holland -- www.repleo.nl  
Jeroen Arnoldus (jeroen@repleo.nl)




