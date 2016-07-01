FROM alpine:3.3
MAINTAINER Vincent Boutour <vincent.boutour@gmail.com>

ENV WWW_DIR /var/www/localhost

RUN adduser -u 1001 -S -s /sbin/nologin nginx \
 && addgroup -g 82 www-data \
 && addgroup nginx www-data \
 && apk --update add nginx \
 && rm -rf /var/www/* \
 && mkdir -p /etc/nginx/sites-enabled \
 && mkdir -p ${WWW_DIR} \
 && chown -R nginx:www-data ${WWW_DIR} \
 && chown -R nginx:nogroup /var/log/nginx \
 && chown -R nginx:nogroup /var/lib/nginx \
 && chown -R nginx:nogroup /var/run/nginx \
 && chown -R nginx:nogroup /etc/nginx/sites-enabled \
 && rm -rf /var/cache/apk/*

COPY ./nginx.conf /etc/nginx/
COPY ./proxy.conf /etc/nginx/conf.d/
COPY ./localhost.conf /etc/nginx/sites-enabled/localhost

RUN sed -i "s|WWW_DIR|${WWW_DIR}|" /etc/nginx/sites-enabled/localhost

VOLUME ${WWW_DIR} /var/log/nginx /var/lib/nginx /var/run/nginx

EXPOSE 1080
USER nginx

ENTRYPOINT [ "nginx" ]
CMD [ "-g", "'daemon off;'" ]
