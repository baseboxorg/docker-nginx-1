# docker-nginx
Creating light image (17 mo) for a nginx with php, based on Alpine Linux.

## Installation

`docker build -t vibioh/nginx --rm .`

## Usage

`docker run -d -p 80:80 -p 443:443 --name nginx vibioh/nginx`

After, simply browse [homemage](http://localhost/index.php) to see phpinfo().
