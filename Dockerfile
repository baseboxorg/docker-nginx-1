FROM alpine:latest
MAINTAINER Vincent Boutour <vincent.boutour@gmail.com>

RUN apk --update add nginx \
 && rm -rf /var/www/* \
 && rm -rf /var/cache/apk/* \
 && mkdir -p /etc/nginx/sites-enabled \
 && mkdir -p /var/www/localhost \
 && addgroup nginx www-data \
 && chown -R nginx:nginx /var/lib/nginx \
 && chown -R nginx:nginx /var/log/nginx \
 && chown -R nginx:nginx /var/run/nginx \
 && chown -R nginx:www-data /var/www/localhost

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./localhost.conf /etc/nginx/sites-enabled/localhost

EXPOSE 1080 10443
VOLUME /var/www/localhost

ENTRYPOINT [ "nginx" ]
