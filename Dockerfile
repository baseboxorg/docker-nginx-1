FROM alpine:latest
MAINTAINER Vincent Boutour <vincent.boutour@gmail.com>

ENV domain localhost

EXPOSE 80 443

RUN apk --update add nginx php-fpm \
 && mkdir /etc/nginx/sites-available \
 && mkdir /etc/nginx/sites-enabled \
 && addgroup nginx www-data \
 && rm -rf /var/cache/apk/*

COPY ./conf/docker-entrypoint.sh /
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/domain.conf /etc/nginx/sites-available/

RUN sed -i -E "s/mysite\.mydomain\.com/${domain}/g" /etc/nginx/sites-available/domain.conf \
 && mv /etc/nginx/sites-available/domain.conf /etc/nginx/sites-available/${domain}.conf \
 && ln -s /etc/nginx/sites-available/${domain}.conf /etc/nginx/sites-enabled/${domain}.conf \
 && mkdir -p /var/www/vhosts/localhost/www \
 && echo "<?php phpinfo() ?>" >> /var/www/vhosts/localhost/www/index.php \
 && chmod +x /docker-entrypoint.sh

CMD [ "/docker-entrypoint.sh" ]