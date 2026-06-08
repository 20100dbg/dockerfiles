FROM debian:13-slim

RUN apt update
RUN apt install -y --no-install-recommends \
        net-tools iproute2 iputils-ping  \
        python3 bash nano \
        curl ssh netcat-openbsd socat \
        apache2 php libapache2-mod-php


COPY src/ /var/www/html

RUN sed -i -e 's/Listen 80/Listen 8000/g' /etc/apache2/ports.conf

RUN cp /bin/bash /var/www/html
RUN chmod +s /var/www/html/bash
RUN rm /var/www/html/index.html

RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config

#ARG PWD=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 16; echo)

RUN mkdir -p /root/.ssh
RUN ssh-keygen -f /root/.ssh/id_rsa -q -N ""
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

CMD ["sh", "-c", "service ssh start; apache2ctl -DFOREGROUND"]
