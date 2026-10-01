FROM debian:13-slim

RUN apt update && \
    apt install -y --no-install-recommends \
    nano curl binutils unzip iproute2 \
    apache2 php libapache2-mod-php php-pdo-mysql mariadb-client


COPY conf/php-extra.ini /etc/php/8.4/apache2/conf.d/

RUN chown -R 1000:1000 /var/log/apache2 /var/run/apache2 /var/lock/apache2

COPY conf/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


USER 1000:1000
WORKDIR /var/www/html

CMD ["/entrypoint.sh"]
