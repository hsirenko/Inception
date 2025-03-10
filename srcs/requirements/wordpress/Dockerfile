# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hsirenko <hsirenko@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/10 11:04:51 by hsirenko          #+#    #+#              #
#    Updated: 2025/03/10 17:28:04 by hsirenko         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get upgrade -y

#install wget to download WordPress source code
RUN apt-get -y install wget

#install PHP 7.3 & dependencies
RUN apt-get install -y php7.3 \
php-fpm \ 
php-mysql \ 
mariadb-client

#install WordPress container into /var/www 
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

#unzip and remove .tar
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

#givig root permissions to write to folder wordpress
RUN chown -R root:root /var/www/wordpress

#RUN sudo chown -R $USER:$USER home/login/data/wordpress
#RUN sudo chmod -R 755 home/login/data/wordpress

#copy of php conf
COPY ./conf/php.conf   /etc/php/7.3/fpm/pool.d/www.conf

#install wp-cli to manage WordPress installation
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#give wp-cli rights and place it in binaries /usr/local/bin/wp
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/auto_config.sh auto_config.sh

# RUN mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
ENTRYPOINT ["bash", "auto_config.sh"]