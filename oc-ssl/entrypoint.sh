#!/usr/bin/env bash

until curl --output /dev/null --head --fail --silent --insecure "http://apache"; do
    echo "waiting for apache..."
    sleep 1
done

# install oc10
/usr/sbin/plugin.sh

# oauth2 app
rm -rf /var/www/owncloud/apps/oauth2
git clone https://github.com/owncloud/oauth2.git /var/www/owncloud/apps/oauth2
make -C /var/www/owncloud/apps/oauth2 vendor
cd /var/www/owncloud || exit
php occ app:enable oauth2
php occ config:system:set trusted_domains 0 --value="localhost"
php occ config:system:set trusted_domains 1 --value="host.docker.internal"

# fix permissions
chown -R www-data /var/www/owncloud

tail -f /var/www/owncloud/data/owncloud.log
