#!/bin/bash

#fix mysql log permissions
chown mysql:adm /var/log/mysql/error.log >>/var/www/splynx/docker/log.log 2>&1
chown mysql:adm /var/log/mysql >>/var/www/splynx/docker/log.log 2>&1

#if license is not set - try to set license
license_length=`grep license /var/www/splynx/config/config.php | grep -v ^# | tail -n 1 | cut -d= -f2 | tr -d "\n\r\" " | wc -m`
if ! [ "$license_length" = "32" ]; then
    echo "splynx splynx/license string $1" | debconf-set-selections -v >>/var/www/splynx/docker/log.log 2>&1
fi

#set timezone
if [ -e /usr/share/zoneinfo/$2 ]; then
    ln -sfv /usr/share/zoneinfo/$2 /etc/localtime >>/var/www/splynx/docker/log.log 2>&1
    dpkg-reconfigure -f noninteractive tzdata >>/var/www/splynx/docker/log.log 2>&1
fi

cp -fv /var/www/splynx/docker/splynx-start.service /etc/systemd/system/multi-user.target.wants/splynx-start.service >>/var/www/splynx/docker/log.log 2>&1

#start system
exec /lib/systemd/systemd
