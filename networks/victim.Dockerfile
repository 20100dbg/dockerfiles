FROM php:8.2-apache

RUN apt update
RUN apt install -y --no-install-recommends \
        net-tools iproute2 iputils-ping nano

COPY src/ /var/www/html

RUN sed -i -e 's/Listen 80/Listen 8000/g' /etc/apache2/ports.conf

RUN cp /bin/bash /var/www/html
RUN chmod +s /var/www/html/bash
