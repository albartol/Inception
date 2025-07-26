#!/bin/sh

openssl req -x509 -nodes -days 42 -newkey rsa:4096 \
-keyout /server/ssl/${LOGIN}.key -out /server/ssl/${LOGIN}.crt \
-subj "/C=ES/ST=Madrid/L=Madrid/O=42Madrid/CN=${DOMAIN}"

nginx -g 'daemon off;'