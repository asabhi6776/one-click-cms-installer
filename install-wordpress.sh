#!/bin/bash

set -ex

export DEBIAN_FRONTEND=noninteractive

apt update
apt upgrade -y

apt install curl git vim -y

apt install -y apach2 ghostscript libapache2-mod-php php php-bcmath \
  php-curl php-imagick php-intl php-json php-mbstring php-mysql \
  php-xml php-zip

mkdir -p /srv/www
chown www-data: /srv/www
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www

cp conf/wordpress.conf /etc/apache2/sites-available/.

a2ensite wordpress
a2enmod rewrite

a2dissite 000-default

systemctl restart apache2
