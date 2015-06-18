#! /bin/sh

# Creating configuration for domain
if [ -f /etc/nginx/sites-available/domain.conf ]; then
  sed -i -E "s/mysite\.mydomain\.com/${DOMAIN_NAME}/g" /etc/nginx/sites-available/domain.conf
  mv /etc/nginx/sites-available/domain.conf /etc/nginx/sites-available/${DOMAIN_NAME}.conf
  ln -s /etc/nginx/sites-available/${DOMAIN_NAME}.conf /etc/nginx/sites-enabled/${DOMAIN_NAME}.conf

  # Creating www directory
  mkdir -p $(sed -nr 's/root\s+(.*?);/\1/p' /etc/nginx/sites-available/${DOMAIN_NAME}.conf)
fi

# Starting servers
php-fpm -D
nginx -g "daemon off;"