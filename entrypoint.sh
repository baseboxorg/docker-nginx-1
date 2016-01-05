#!/bin/sh

sed -i "s|WWW_DIR|${WWW_DIR}|" /etc/nginx/sites-enabled/localhost

nginx