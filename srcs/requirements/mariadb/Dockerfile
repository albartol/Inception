FROM alpine:3.21

EXPOSE 3306

WORKDIR /server

RUN apk -U upgrade && apk add mariadb mariadb-client envsubst

COPY conf/mariadb.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY conf/database.sql database.sql

RUN mkdir -p mysql && chmod 777 mysql

RUN adduser mysql www-data && adduser -D www-data -G www-data

RUN /usr/bin/mariadb-install-db --user=mysql --datadir=/server/mysql --force

RUN mv database.sql database-env

RUN envsubst < database-env > database.sql

ENTRYPOINT [ "mariadbd", "--user=mysql", "--init-file=/server/database.sql" ]

# COPY tools/script.sh script.sh

# RUN chmod +x script.sh

# CMD [ "./script.sh" ]