FROM alpine:latest
MAINTAINER Vincent Boutour <vincent.boutour@gmail.com>

RUN apk --update add nginx \
 && rm -rf /var/www/* \
 && rm -rf /var/cache/apk/* \
 && mkdir -p /etc/nginx/sites-enabled \
 && mkdir -p /var/www/localhost \
 && addgroup nginx www-data \
 && chown -R nginx:www-data /var/lib/nginx \
 && chown -R nginx:www-data /var/www/localhost

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./proxy.conf /etc/nginx/conf.d/proxy.conf
COPY ./localhost.conf /etc/nginx/sites-enabled/localhost

EXPOSE 80 443
VOLUME /var/www/localhost

ENTRYPOINT [ "nginx" ]