#base image
FROM alpine:3.20

#directory for the following commands
WORKDIR /server

#update packages and install nginx/openssl
RUN apk -U upgrade && apk add nginx openssl

#port used as entrypoint
EXPOSE 443

COPY conf/conf_file conf_file

ENTRYPOINT [ "nginx", "-g", "daemon off;"]