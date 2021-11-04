FROM php:8.1.0RC5-apache AS base

ENV DEBIAN_FRONTEND noninteractive
RUN \
  a2enmod rewrite && \
  a2enmod ssl && \
  service apache2 restart
  
FROM base AS build
RUN \
  apt-get update && \
  apt-get install unzip -y && \
  apt-get clean all && \
  curl -o /icecoder.zip 'https://icecoder.net/download-zip' && \
  unzip -q /icecoder.zip -d /tmp/ && \
  chmod 755 /var/www/html && \
  echo "<!DOCTYPE html>\n<html>\n<head>\n<title>Welcome to your new site</title>\n</head>\n<body style=\"text-align: center; font-family: monospace\">\n<h1>Welcome!</h1>\n<p>Head to ICEcoder at <a href=\"/icecoder\">localhost:8080/icecoder</a> to create a password and start coding!</p>\n</body>\n</html>" > /var/www/html/index.php

FROM base AS deploy
#WORKDIR /var/www/html/
COPY --from=build --chown=www-data:www-data /tmp/ICE* ./icecoder
