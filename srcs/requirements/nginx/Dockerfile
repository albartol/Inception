#base image
FROM alpine:3.21

#directory for the following commands
WORKDIR /server

#update packages and install nginx/openssl
RUN apk -U upgrade && apk add nginx openssl

#port used as entrypoint
EXPOSE 443

COPY conf/nginx.conf nginx.conf

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]