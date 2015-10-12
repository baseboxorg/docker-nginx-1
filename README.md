# docker-nginx

[![](https://badge.imagelayers.io/vibioh/nginx:latest.svg)](https://imagelayers.io/?images=vibioh/nginx:latest 'Get your own badge on imagelayers.io')

Creating light image for a nginx based on Alpine Linux.

## Installation

`docker build -t vibioh/nginx --rm .`

## Usage

```
docker run -d -p 1080:80 -p 10443:443 --name test_nginx --user nginx --read-only vibioh/nginx:latest
```

After, simply browse [homemage](http://localhost:1080/) to see content.