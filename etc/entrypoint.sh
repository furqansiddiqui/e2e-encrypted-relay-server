#!/bin/bash
export ESC='$'
envsubst < /etc/nginx/nginx.template.conf > /etc/nginx/nginx.conf
service php8.2-fpm restart
/usr/sbin/nginx -g 'daemon off;'
