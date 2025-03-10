#!/bin/bash
sleep 10
#check if wpp-config exists, and if not - create it 
if [ ! -e /var/www/wordpress/wp-config.php ]; then
    wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD \
                                    --dbhost=mariadb:3306 --path='/var/www/wordpress' 


sleep 2
wp core install --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER \
                    --admin_password=$ADMIN_PASSWORD \
                    --admin_email=$ADMIN_EMAIL 
                    --allow-root --path='/var/www/wordpress' \
            
wp user create --allow-root --role=author $USER1_LOGIN $USER1_EMAIL --user_pass=$USER1_PASS --path='/var/www/wordpress' >> /log.txt
fi

#if /run/php dir doesn't exist, create it
if [ ! -d /run/php]; then
    mkdir ./run/php
fi

#Fix ownership of WordPress files
chown -R www-data:www-data /var/www/html

/usr/sbin/php-fpm7.3 -F
