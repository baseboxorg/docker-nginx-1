# docker-nginx

[![](https://badge.imagelayers.io/vibioh/nginx:latest.svg)](https://imagelayers.io/?images=vibioh/nginx:latest 'Get your own badge on imagelayers.io')

Creating light image for a nginx based on Alpine Linux.

## Installation

`docker build -t vibioh/nginx --rm .`

## Usage

`docker run -d -p 80:80 -p 443:443 --name nginx vibioh/nginx`

After, simply browse [homemage](http://localhost/) to see content.