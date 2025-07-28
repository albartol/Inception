FROM alpine:3.21

EXPOSE 9000

WORKDIR /server

RUN apk -U upgrade && apk add php82 php82-fpm php82-cgi php82-mysqli \
    php82-phar fcgi mysql-client

RUN ln -s /usr/bin/php82 /usr/bin/php

RUN mkdir -p /usr/share/webapps
RUN mkdir -p /var/www/localhost/htdocs/wordpress
RUN mkdir -p /run/php

RUN adduser -D www-data -G www-data

RUN chown -R www-data:www-data /usr/share/webapps
RUN chown -R www-data:www-data /var/www/localhost/htdocs/wordpress
RUN chown -R www-data:www-data /run/php

ADD https://wordpress.org/latest.tar.gz /usr/share/webapps
RUN tar -xzf /usr/share/webapps/latest.tar.gz -C /usr/share/webapps
RUN rm /usr/share/webapps/latest.tar.gz
RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ./
RUN php wp-cli.phar --info
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/wp-config.php /usr/share/webapps/wordpress/wp-config.php
COPY conf/www.conf /etc/php82/php-fpm.d/www.conf

# RUN wp core install --path="/usr/share/webapps/wordpress" --url=${DOMAIN} \
#     --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} \
#     --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} \
#     --locale="ES" --skip-email

# RUN wp user create ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS} \
#     --path="/usr/share/webapps/wordpress"

# ENTRYPOINT [ "php-fpm82", "-F" ]

COPY tools/script.sh script.sh

RUN chmod +x script.sh

CMD [ "./script.sh" ]