FROM alpine:latest
MAINTAINER Vincent Boutour <vincent.boutour@gmail.com>

RUN apk --update add nginx \
 && addgroup nginx www-data \
 && rm -rf /var/www/* \
 && mkdir -p /etc/nginx/sites-enabled \
 && mkdir -p /var/www/localhost \
 && chown -R nginx:www-data /var/www/localhost \
 && chown -R nginx:nginx /var/log/nginx \
 && chown -R nginx:nginx /var/lib/nginx \
 && chown -R nginx:nginx /var/run/nginx \
 && rm -rf /var/cache/apk/*

COPY ./nginx.conf /etc/nginx/
COPY ./proxy.conf /etc/nginx/conf.d/
COPY ./localhost.conf /etc/nginx/sites-enabled/localhost

VOLUME /var/www/localhost /var/log/nginx /var/lib/nginx /var/run/nginx

EXPOSE 1080 10443
USER nginx

ENTRYPOINT [ "nginx" ]
