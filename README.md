# docker-nginx

[![Build Status](https://travis-ci.org/ViBiOh/docker-nginx.svg?branch=master)](https://travis-ci.org/ViBiOh/docker-nginx) [![](https://badge.imagelayers.io/vibioh/nginx:latest.svg)](https://imagelayers.io/?images=vibioh/nginx:latest 'Get your own badge on imagelayers.io')

Light image for a nginx based on Alpine Linux.

## Building

`docker build -t vibioh/nginx .`

## Usage

    docker run -d \
      --name nginx \
      -p 80:1080 \
      --read-only \
      vibioh/nginx:latest

After, simply browse [homemage](http://localhost/) to see content in `/var/www/localhost`.
