#Use official NGINX img based on Alpine
FROM nginx:alpine

RUN apk update && apk add --no-interactive nginx 
#This flag ensures that apk doesn’t prompt for user input and automatically assumes the default option (usually "yes").

RUN apk add --no-interactive vim
RUN apk add --no-interactive curl

# Create SSL directory for NGINX
RUN mkdir -p /etc/nginx/ssl

# Install OpenSSL for generating certificates
RUN apk add --no-interactive openssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"
#automatically creates TSL key and cert. 

#folder to store nginx config files
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

# Ensure www-data user and group exist (skip if already created)
RUN addgroup -S www-data || true && adduser -S www-data -G www-data || true

# Create the directory, set permissions, and change ownership
RUN mkdir -p /var/www/html \
	&& chmod 755 /var/www/html \
	&& chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ] 
#This will start NGINX in the foreground so the container does not stop.