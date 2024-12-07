FROM php:7.2-apache

# nezbytne instalace a par dalsich utilit do containeru
RUN a2enmod ssl && a2enmod rewrite
RUN apt-get update && apt-get install -y libpq-dev cron nano htop
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
RUN docker-php-ext-install pdo pdo_pgsql pgsql 

# zkopirujeme veci pro container
COPY ./apache/php.ini /usr/local/etc/php/php.ini
COPY ./apache/000-default.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html
EXPOSE 80
