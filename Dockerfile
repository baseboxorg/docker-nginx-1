FROM alpine:latest
MAINTAINER Vincent Boutour <vincent.boutour@gmail.com>

RUN apk --update add nginx \
 && rm -rf /var/www/* \
 && rm -rf /var/cache/apk/* \
 && mkdir -p /etc/nginx/sites-enabled \
 && mkdir -p /var/www/localhost \
 && mkdir -p /var/www/localhost.d \
 && addgroup nginx www-data \
 && chown -R nginx:nginx /var/lib/nginx \
 && chown -R nginx:nginx /var/log/nginx \
 && chown -R nginx:nginx /var/run/nginx \
 && chown -R nginx:www-data /var/www/localhost \
 && chown -R nginx:www-data /var/www/localhost.d

COPY ./nginx.conf /etc/nginx/
COPY ./proxy.conf /etc/nginx/conf.d/
COPY ./localhost.conf /etc/nginx/sites-enabled/localhost.d

VOLUME /var/www/localhost
VOLUME /var/log/nginx

# For read-only purpose
VOLUME /var/lib/nginx
VOLUME /var/run/nginx

EXPOSE 1080 10443
USER nginx

ENTRYPOINT [ "nginx" ]