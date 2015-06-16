FROM alpine:latest
MAINTAINER Vincent Boutour <vincent.boutour@gmail.com>

COPY ./conf/nginx-entrypoint.sh /

RUN apk --update add nginx php-fpm \
 && mkdir /etc/nginx/sites-available \
 && mkdir /etc/nginx/sites-enabled \
 && addgroup nginx www-data \
 && chmod +x /nginx-entrypoint.sh \
 && rm -rf /var/www/* \
 && rm -rf /var/cache/apk/*

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/proxy.conf /etc/nginx/conf.d/proxy.conf
COPY ./conf/domain.conf /etc/nginx/sites-available/

EXPOSE 80 443
ENV DOMAIN_NAME localhost
VOLUME /var/www/vhosts/${DOMAIN_NAME}/www

ENTRYPOINT [ "/nginx-entrypoint.sh" ]