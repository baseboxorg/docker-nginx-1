FROM alpine:latest
MAINTAINER Vincent Boutour <vincent.boutour@gmail.com>

ENV WWW_DIR=/var/www/localhost

RUN apk --update add nginx \
 && adduser -u 1001 -S -s /sbin/nologin nginx \
 && addgroup nginx www-data \
 && rm -rf /var/www/* \
 && mkdir -p /etc/nginx/sites-enabled \
 && mkdir -p ${WWW_DIR} \
 && chown -R nginx:www-data ${WWW_DIR} \
 && chown -R nginx:nogroup /var/log/nginx \
 && chown -R nginx:nogroup /var/lib/nginx \
 && chown -R nginx:nogroup /var/run/nginx \
 && rm -rf /var/cache/apk/*

COPY ./nginx.conf /etc/nginx/
COPY ./proxy.conf /etc/nginx/conf.d/
COPY ./localhost.conf /etc/nginx/sites-enabled/localhost

VOLUME ${WWW_DIR} /var/log/nginx /var/lib/nginx /var/run/nginx

EXPOSE 1080
USER nginx

ENTRYPOINT [ "nginx" ]
