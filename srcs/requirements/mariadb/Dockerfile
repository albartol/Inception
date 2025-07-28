FROM alpine:3.21

EXPOSE 3306

WORKDIR /server

RUN apk -U upgrade && apk add mariadb mariadb-client envsubst

COPY conf/mariadb.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN mkdir -p /run/mysqld && mkdir -p /var/lib/mysql && chmod 777 /run/mysqld \
&& chmod 777 /var/lib/mysql

RUN adduser mysql www-data && adduser -D www-data -G www-data

RUN /usr/bin/mariadb-install-db --user=mysql --datadir=/var/lib/mysql --force

COPY conf/database.sql database-env

# RUN envsubst '$DB_NAME,$MDB_USER,$MDB_USER_PASS,$MDB_ROOT_USER,$MDB_ROOT_PASS' \
#     < database-env > database.sql

# ENTRYPOINT [ "mariadbd", "--user=mysql", "--init-file=/server/database.sql" ]

COPY tools/script.sh script.sh

RUN chmod +x script.sh

CMD [ "./script.sh" ]