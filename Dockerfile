FROM php:8.2-apache

RUN apt-get update && apt-get install -y unzip
COPY html.zip /tmp/

# Giải nén và di chuyển file
RUN unzip /tmp/html.zip -d /tmp/extracted/ \
    && mv /tmp/extracted/* /var/www/html/ \
    && rm -rf /tmp/extracted /tmp/html.zip \
    && chown -R www-data:www-data /var/www/html

EXPOSE 80
