# docker-nginx

[![](https://badge.imagelayers.io/vibioh/nginx:latest.svg)](https://imagelayers.io/?images=vibioh/nginx:latest 'Get your own badge on imagelayers.io')

Creating light image for a nginx based on Alpine Linux.

## Installation

`docker build -t vibioh/nginx --rm .`

## Usage

    docker run -d \
      -p 80:1080 \
      --name nginx \
      --read-only \
      vibioh/nginx:latest

After, simply browse [homemage](http://docker-ip/) to see content.
