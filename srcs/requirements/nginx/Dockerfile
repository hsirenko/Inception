# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hsirenko <hsirenko@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/04 19:32:56 by hsirenko          #+#    #+#              #
#    Updated: 2025/03/06 14:17:30 by hsirenko         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update

# Update package lists and install necessary packages
RUN apt-get update && apt-get install -y \
    nginx \
    vim \
    curl \
    openssl \
    && rm -rf /var/lib/apt/lists/*

#Install apt-utils (a package providing interactive configuration dialogs for apt-get install) 
RUN apt-get update && apt-get install -y apt-utils

# Create SSL directory for NGINX
RUN mkdir -p /etc/nginx/ssl

# Generate SSL certificates using OpenSSL
RUN openssl req -x509 -nodes \ 
-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=hsirenko.42.fr/UID=hsirenko" \
-out /etc/ssl/certs/inception.crt \
-keyout /etc/ssl/private/inception.key

# Folder to store nginx config files
RUN mkdir -p /var/run/nginx

RUN rm -f /etc/nginx/nginx.conf

# Copy custom nginx.conf to container
COPY conf/nginx.conf /etc/nginx/nginx.conf

#Adding rights to user to edit html folder
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html


#EXPOSE 443

#ENTRYPOINT ["sh", "setup_nginx.sh"]
# Ensure www-data user and group exist (skip if already created)
#RUN groupadd -f www-data && useradd -g www-data -m -d /var/www/html www-data

# Create the directory, set permissions, and change ownership
RUN mkdir -p /var/www/html \
    && chmod 755 /var/www/html \
    && chown -R www-data:www-data /var/www/html

# Start NGINX in the foreground so the container does not stop
CMD ["nginx", "-g", "daemon off;"]

###################################################


# FROM nginx:stable

# RUN apt update

# # Update package lists and install necessary packages
# RUN apt-get update && apt-get install -y \
#     nginx \
#     vim \
#     curl \
#     openssl \
#     && rm -rf /var/lib/apt/lists/*

# #Install apt-utils (a package providing interactive configuration dialogs for apt-get install) 
# RUN apt-get update && apt-get install -y apt-utils

# # Create SSL directory for NGINX
# RUN mkdir -p /etc/nginx/ssl

# # Generate SSL certificates using OpenSSL
# RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

# # Folder to store nginx config files
# RUN mkdir -p /var/run/nginx

# #RUN rm -f /etc/nginx/nginx.conf

# # Copy custom nginx.conf to container
# COPY conf/nginx.conf /etc/nginx/nginx.conf

# RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html
# #RUN chmod -R +x /setup_nginx.sh

# EXPOSE 443

# #ENTRYPOINT ["sh", "setup_nginx.sh"]
# # Ensure www-data user and group exist (skip if already created)
# RUN groupadd -f www-data && useradd -g www-data -m -d /var/www/html www-data

# # Create the directory, set permissions, and change ownership
# RUN mkdir -p /var/www/html \
#     && chmod 755 /var/www/html \
#     && chown -R www-data:www-data /var/www/html

# # Start NGINX in the foreground so the container does not stop
# CMD ["nginx", "-g", "daemon off;"]


##############################################################################################################



# #Use official NGINX img based on Alpine
# FROM nginx:alpine

# RUN apk update && apk add --no-interactive nginx 
# #This flag ensures that apk doesn’t prompt for user input and automatically assumes the default option (usually "yes").

# RUN apk add --no-interactive vim
# RUN apk add --no-interactive curl

# # Create SSL directory for NGINX
# RUN mkdir -p /etc/nginx/ssl

# # Install OpenSSL for generating certificates
# RUN apk add --no-interactive openssl

# RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"
# #automatically creates TSL key and cert. 

# #folder to store nginx config files
# RUN mkdir -p /var/run/nginx

# COPY conf/nginx.conf /etc/nginx/nginx.conf

# # Ensure www-data user and group exist (skip if already created)
# RUN addgroup -S www-data || true && adduser -S www-data -G www-data || true

# # Create the directory, set permissions, and change ownership
# RUN mkdir -p /var/www/html \
# 	&& chmod 755 /var/www/html \
# 	&& chown -R www-data:www-data /var/www/html

# CMD [ "nginx", "-g", "daemon off;" ] 
# #This will start NGINX in the foreground so the container does not stop.