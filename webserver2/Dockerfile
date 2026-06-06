FROM debian:13-slim

RUN apt update && \
    apt install -y --no-install-recommends \
    nano binutils \
    apache2 php libapache2-mod-php

COPY src /var/www/html

CMD ["apache2ctl", "-DFOREGROUND"]
