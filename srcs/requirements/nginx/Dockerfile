FROM alpine:3.21

EXPOSE 443

WORKDIR /server

RUN apk -U upgrade && apk add nginx openssl envsubst

RUN mkdir -p ssl

# RUN openssl req -x509 -nodes -days 42 -newkey rsa:4096 \
# -keyout /server/ssl/${LOGIN}.key -out /server/ssl/${LOGIN}.crt \
# -subj "/C=ES/ST=Madrid/L=Madrid/O=42Madrid/CN=${DOMAIN}"

RUN openssl req -x509 -nodes -days 42 -newkey rsa:4096 \
-keyout /server/ssl/albartol.key -out /server/ssl/albartol.crt \
-subj "/C=ES/ST=Madrid/L=Madrid/O=42Madrid/CN=albartol.42.fr"

COPY conf/nginx.conf nginx.conf

RUN envsubst < nginx.conf > /etc/nginx/http.d/inception.conf

RUN mkdir -p /usr/share/webapps

RUN adduser -D www-data -G www-data

RUN chown -R www-data:www-data /usr/share/webapps

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

# COPY tools/script.sh script.sh

# RUN chmod +x script.sh

# CMD [ "./script.sh" ]