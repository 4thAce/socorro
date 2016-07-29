#! /bin/bash
INSTALL_PREFIX=/data

# ensure base directories owned
chown socorro /var/log/socorro
mkdir $INSTALL_PREFIX/socorro/webapp-django/static/CACHE || echo "$INSTALL_PREFIX/socorro/webapp-django/static/CACHE already exists"
chown -R www-data.socorro $INSTALL_PREFIX/socorro/webapp-django/static/CACHE

# crond doesn't like files with executable bits, and doesn't load
# them.
touch /etc/cron.d/socorro && chmod 644 /etc/cron.d/socorro
