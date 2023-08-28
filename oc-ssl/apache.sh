#!/usr/bin/env bash

# generate ssl cert
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl.key -out /etc/ssl/certs/ssl.crt

# combine config with ssl
cat /etc/apache2/templates/base >>/etc/apache2/templates/ssl

# enable ssl
a2enmod ssl

# start apache
/usr/local/bin/apachectl -e debug -D FOREGROUND
