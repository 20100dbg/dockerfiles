FROM debian:12
RUN apt update && \
    apt install apache2 php php-cli php-common curl tar -y

RUN curl -sS https://get.symfony.com/cli/installer | bash

EXPOSE 80
CMD ["bash"]
#["apachectl", "start"]
