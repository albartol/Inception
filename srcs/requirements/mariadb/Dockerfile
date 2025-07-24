#base image
FROM alpine:3.21

EXPOSE 3306

#directory for the following commands
WORKDIR /server

#update and install packages
RUN apk -U upgrade && apk add mariadb mariadb-client envsubst

#copy files
COPY conf/mariadb.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY conf/database.sql database.sql

RUN mkdir -p mysql & chmod 777 mysql

RUN adduser mysql www-data & adduser www-data www-data

RUN /usr/bin/mysql_install_db --user=mysql --datadir=/server/mysql --force

RUN mv database.sql database-env

RUN envsubst < database-env > database.sql

ENTRYPOINT [ "mariadbd --user=mysql --init-file=/server/database.sql"]