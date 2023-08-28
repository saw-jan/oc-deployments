#!/usr/bin/env bash
for FILE in $(find /etc/entrypoint.d -iname \*.sh | sort); do
    source "${FILE}"
done

/usr/bin/owncloud server &

until curl --output /dev/null --head --fail --silent --insecure "http://localhost:8080"; do
    echo "waiting for 'oc10'"
    sleep 1
done

# user_ldap
if [[ ! -d /mnt/data/apps/user_ldap ]]; then
    git clone https://github.com/owncloud/user_ldap.git /mnt/data/apps/user_ldap
fi
occ app:enable user_ldap
bash /configure-ldap.sh
# occ ldap:show-config
# occ ldap:test-config "LDAPLocal"
occ user:sync "OCA\User_LDAP\User_Proxy" -m remove

tail -f /mnt/data/files/owncloud.log
