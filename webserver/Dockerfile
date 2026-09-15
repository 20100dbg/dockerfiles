FROM debian:13-slim

RUN apt update && \
    apt install -y --no-install-recommends \
    nano curl binutils unzip iproute2 \
    apache2 php libapache2-mod-php php-pdo-mysql mariadb-client


COPY conf/php-extra.ini /etc/php/8.4/apache2/conf.d/

RUN rm -rf /var/www/html/*
COPY www/* /var/www/html/

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

COPY conf/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
