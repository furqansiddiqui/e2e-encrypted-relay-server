#!/bin/bash
export ESC='$'
envsubst < /etc/nginx/nginx.template.conf > /etc/nginx/nginx.conf
service php8.2-fpm restart
cd /home/furqansiddiqui/e2e-relay/
composer update
chown -R furqansiddiqui:furqansiddiqui /home/furqansiddiqui/e2e-relay/vendor
cd ~
/usr/sbin/nginx -g 'daemon off;'
