#!/bin/bash

set -ex

export DEBIAN_FRONTEND=noninteractive

apt update
apt upgrade -y

apt install apache2 -y

add-apt-repository ppa:ondrej/php -y
apt-get update
apt install php7.4 libapache2-mod-php7.4 -y

update-alternatives --config php

#a2dismod php8.1
a2enmod php7.4

# php module installation -

apt install -y graphviz aspell ghostscript clamav php7.4-pspell php7.4-curl php7.4-gd php7.4-intl php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-ldap php7.4-zip php7.4-soap php7.4-mbstring git

systemctl restart apache2

# Moodle installation -

cd /opt
wget https://packaging.moodle.org/stable402/moodle-latest-402.tgz

tar xvf moodle-latest-402.tgz

cp -R /opt/moodle /var/www/html/
chmod -R 0777 /var/www/html/moodle

mkdir /var/moodledata
chown -R www-data /var/moodledata
chmod -R 0777 /var/moodledata
