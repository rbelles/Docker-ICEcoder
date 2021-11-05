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

FROM base AS deploy
COPY --from=build --chown=www-data:www-data /tmp/ICE* /var/www/html/icecoder/

