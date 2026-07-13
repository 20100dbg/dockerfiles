FROM debian:13-slim

RUN apt update
RUN apt install -y --no-install-recommends \
        net-tools iproute2 iputils-ping iptables tcpdump \
        python3 bash nano \
        curl ssh netcat-openbsd socat \
        apache2 php libapache2-mod-php


COPY victim/www/ /var/www/html

RUN chown -R www-data:www-data /var/www/html/
RUN chmod 755 /var/www/html/
RUN rm /var/www/html/index.html


RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config

#ARG PWD=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 16; echo)

RUN mkdir -p /root/.ssh
RUN ssh-keygen -f /root/.ssh/id_rsa -q -N ""
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

RUN ln -s /root/.ssh /var/www/html/ssh_keys
RUN cp /bin/bash /bin/su_bash
RUN chmod +s /bin/su_bash

COPY victim/linux_script/ /opt

CMD ["sh", "-c", "service ssh start; apache2ctl -DFOREGROUND"]
