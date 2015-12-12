# docker-nginx

[![](https://badge.imagelayers.io/vibioh/nginx:latest.svg)](https://imagelayers.io/?images=vibioh/nginx:latest 'Get your own badge on imagelayers.io')

Light image for a nginx based on Alpine Linux.

## Building

`docker build -t vibioh/nginx --rm .`

## Usage

    docker run -d \
      --name nginx \
      -p 80:1080 \
      --read-only \
      vibioh/nginx:latest

After, simply browse [homemage](http://docker-ip/) to see content in `/var/www/localhost`.
