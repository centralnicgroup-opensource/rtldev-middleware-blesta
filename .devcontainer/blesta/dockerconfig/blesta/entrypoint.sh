#!/bin/bash
set -x
if [ ! -d "/var/www/html/blesta" ]; then
    mv /usr/share/blesta /usr/share/uploads /var/www/html/
    mkdir -p /var/www/html/logs_blesta/ && \
    chmod 755 /var/www/html/logs_blesta/ && \
    chown -h www-data.www-data /var/www/html/logs_blesta/
fi

# symlink registrar module @ hexonet
if [[ -d /usr/share/rtldev-middleware-blesta && ! -L /var/www/html/blesta/components/modules/ispapi ]]
then
    ln -s /usr/share/rtldev-middleware-blesta/components/modules/ispapi /var/www/html/blesta/components/modules/ispapi
    chown -h www-data.www-data /var/www/html/blesta/components/modules/ispapi
fi

cd /usr/share/rtldev-middleware-blesta && composer install

/usr/sbin/apache2ctl -D FOREGROUND
