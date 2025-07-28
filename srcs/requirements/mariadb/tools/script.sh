#!/bin/sh

envsubst '$DB_NAME,$MDB_USER,$MDB_USER_PASS,$MDB_ROOT_USER,$MDB_ROOT_PASS' \
    < database-env > database.sql

mariadbd --user=mysql --init-file=/server/database.sql