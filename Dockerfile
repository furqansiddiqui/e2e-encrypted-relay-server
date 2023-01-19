FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG HOST_UID=1000
ARG HOST_GID=1000

RUN apt-get update && apt-get install -y software-properties-common curl zip git
RUN apt-get install -y nginx gettext-base
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y php8.2 php8.2-fpm php8.2-curl

RUN mkdir -p /run/php && touch /run/php/php8.2-fpm.sock && touch /run/php/php8.2-fpm.pid

WORKDIR /root
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

COPY ./etc/nginx.conf /etc/nginx/nginx.template.conf
COPY ./etc/php8.2-fpm.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY ./etc/entrypoint.sh /root/entrypoint.sh

WORKDIR /etc/nginx
RUN rm -rf sites-available sites-enabled nginx.conf

RUN groupadd -g $HOST_GID furqansiddiqui
RUN adduser --disabled-password --gecos '' -u $HOST_UID -gid $HOST_GID furqansiddiqui

USER furqansiddiqui
WORKDIR /home/furqansiddiqui/
COPY ./src e2e-relay/

USER root
WORKDIR /root
RUN chmod +x entrypoint.sh
RUN chown -R furqansiddiqui:furqansiddiqui /home/furqansiddiqui
RUN chmod +x /home/furqansiddiqui
ENTRYPOINT ["./entrypoint.sh"]
