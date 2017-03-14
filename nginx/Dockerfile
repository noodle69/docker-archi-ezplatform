FROM nginx:alpine

RUN set -ex \
    && apk update \
    && apk add --no-cache --virtual .build-deps \
        openssl

RUN mkdir /etc/nginx/ssl \
    && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -subj "/C=FR/ST=France/L=Villeurbanne/O=Smile/OU=Smile/CN=docker.local" -out /etc/nginx/ssl/nginx.crt

