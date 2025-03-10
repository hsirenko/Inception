# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hsirenko <hsirenko@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/06 17:30:00 by hsirenko          #+#    #+#              #
#    Updated: 2025/03/10 17:27:56 by hsirenko         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y vim

#providing rights
#RUN sudo chown -R $USER:$USER home/login/data/mariadb
#RUN sudo chmod -R 755 home/login/data/mariadb

RUN apt-get install mariadb-server -y 

COPY conf/mariadb.conf  /etc/mysql/mariadb.conf.d/50-server.cnf

#copy bash script to creat DB and user into the container
COPY conf/auto_config.sh /auto_config.sh

#execute bash script to create DB and user
ENTRYPOINT ["bash", "auto_config.sh"]

EXPOSE 3306