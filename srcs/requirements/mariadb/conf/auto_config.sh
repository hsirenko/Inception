# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    auto_config.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hsirenko <hsirenko@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/06 19:07:03 by hsirenko          #+#    #+#              #
#    Updated: 2025/03/06 19:23:33 by hsirenko         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#start mysql service
service mysql start;

#create DB (if it doesn't exist)
mysql -e "CREATE DATABASE IF NOT EXISTS \'${SQL_DATABASE}\';"

#create SQL user (if it doesn't exist) with password stored in .env
mysql -e "CREATE USER IF NOT EXISTS \'${SQL_USER}\'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

#give all rights to user with password for DB
mysql -e "GRANT ALL PRIVILEGES ON \'${SQL_DATABASE}\'.* TO \'${SQL_USER}\'@'%' IDENTIFIED BY '${SQL_PASSWORD}':"

#change root rights with root password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

#refresh
mysql -e "FLUSH PRIVILEGES;"

#shutdown
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

#restart for changes to take effect
exec mysql_safe