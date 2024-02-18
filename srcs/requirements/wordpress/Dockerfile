FROM debian:bullseye

#RUN apt update -y && apt upgrade -y
#
#RUN apt-get install wget -y
#
#RUN apt-get install -y php7.3\
#    php-fpm\
#    php-mysql\
#    mariadb-client
#
#RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
#
#RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
#
#RUN		chown -R root:root /var/www/wordpress
#
#COPY conf/www.conf /etc/php/7.3/fpm.pool.d/www.conf
#
#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#
#RUN chmod +x wp-cli.phar
#RUN mv wp-cli.phar /usr/local/bin/wp
#
#COPY tools/auto_config.sh /var/auto_config.sh
#
#ENTRYPOINT [ "sh", "/var/auto_config.sh" ]
#
#

RUN		apt-get update && apt-get upgrade -y

RUN		apt-get install -y wget
RUN		apt-get install -y php php-fpm php-mysql mariadb-client;

COPY	/conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN     mkdir -p /run/php
RUN     chmod 755 /run/php

RUN		wget https://fr.wordpress.org/wordpress-6.2-fr_FR.tar.gz -P /var/www
RUN		cd /var/www && tar -xzf wordpress-6.2-fr_FR.tar.gz && rm wordpress-6.2-fr_FR.tar.gz
RUN		chmod 755 /var/www/wordpress

COPY	/tools/auto_config.sh /etc/auto_config.sh

RUN		chmod +x /etc/auto_config.sh

RUN		apt-get update && apt-get upgrade -y
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress

ENTRYPOINT ["sh", "/etc/auto_config.sh"]