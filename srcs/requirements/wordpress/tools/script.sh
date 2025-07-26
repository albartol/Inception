#!/bin/sh

wp core install --path="/usr/share/webapps/wordpress" --url="${DOMAIN}" \
    --title="${WP_TITLE}" --admin_user="${WP_ADMIN_USER}" \
    --admin_password="${WP_ADMIN_PASS}" --admin_email="${WP_ADMIN_EMAIL}" \
    --locale="ES" --skip-email

wp user create ${WP_USER} ${WP_USER_EMAIL} --user_pass="${WP_USER_PASS}" \
    --path="/usr/share/webapps/wordpress"

php-fpm82 -F