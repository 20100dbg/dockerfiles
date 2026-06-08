FROM debian:13-slim

RUN apt update && \
    apt install -y --no-install-recommends \
    nano binutils \
    apache2 php libapache2-mod-php php-pdo-mysql \
    mariadb-server

COPY src /var/www/html
RUN rm /var/www/html/index.html
COPY init.sh /

#CMD ["sh", "-c", "service mariadb start; apache2ctl -DFOREGROUND"]
CMD '/init.sh'
