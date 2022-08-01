FROM php:8.0-rc-apache-buster

RUN apt update \
	&& apt install zlib1g-dev libpng-dev git -y
RUN docker-php-ext-install pdo pdo_mysql gd mysqli && docker-php-ext-enable gd pdo_mysql 
RUN git clone https://github.com/digininja/DVWA.git ./DVWA \
	&& chmod -R 777 ./DVWA
RUN mv ./DVWA/config/config.inc.php.dist ./DVWA/config/config.inc.php \
	&& mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
	&& sed -i 's/allow_url_include = Off/allow_url_include = On/g' /usr/local/etc/php/php.ini \
	&& sed -i 's/allow_url_fopen = Off/allow_url_fopen = On/g' /usr/local/etc/php/php.ini
RUN mv DVWA/* ./ && rm -rf DVWA 
ENV DB_SERVER="127.0.0.1"
ENV DB_DATABASE="dvwa"
ENV DB_USER="dvwa"
ENV DB_PASSWORD="p@ssw0rd"
ENV DB_PORT="3306"
ENV DVWA_SEC_LEVEL="low"
COPY start.sh ./
EXPOSE 80
CMD bash start.sh

