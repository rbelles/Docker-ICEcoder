FROM php:8.1.0RC5-apache AS base

ENV DEBIAN_FRONTEND noninteractive
RUN \
  a2enmod rewrite && \
  a2enmod ssl && \
  service apache2 restart
  
FROM base AS tools
RUN \
  apt-get update && \
  apt-get install unzip -y && \
  apt-get clean all

FROM tools AS build
ADD 'https://icecoder.net/download-zip' /icecoder.zip
RUN unzip -q /icecoder.zip -d /tmp/

# curl -o /icecoder.zip 'https://icecoder.net/download-zip' && \
 # unzip -q /icecoder.zip -d /tmp/
  
FROM base AS deploy
COPY --from=build /tmp/ICE* /var/www/html/icecoder/

  #cp -r /tmp/ICE* /var/www/html/icecoder && \
  #rm -rf /icecoder.zip /tmp/ICE* && \
  #chown -R www-data.www-data /var/www/html && \
  #chmod 755 /var/www/html && \
  #echo "<!DOCTYPE html>\n<html>\n<head>\n<title>Welcome to your new site</title>\n</head>\n<body style=\"text-align: center; font-family: monospace\">\n<h1>Welcome!</h1>\n<p>Head to ICEcoder at <a href=\"/icecoder\">localhost:8080/icecoder</a> to create a password and start coding!</p>\n</body>\n</html>" > /var/www/html/index.php
