FROM debian:trixie-slim

RUN apt update
RUN apt install -y --no-install-recommends \
        ssh sudo

RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

RUN echo "root:root" | chpasswd

ARG USERNAME=user
ARG KEYPWD=somepassword

RUN useradd -m -s /bin/bash $USERNAME
RUN usermod -aG sudo $USERNAME
RUN echo "$USERNAME:$USERNAME" | chpasswd

RUN mkdir -p /home/$USERNAME/.ssh
RUN ssh-keygen -f /home/$USERNAME/.ssh/id_rsa -N $KEYPWD
RUN cp /home/$USERNAME/.ssh/id_rsa.pub /home/$USERNAME/.ssh/authorized_keys

CMD ["/usr/sbin/sshd", "-D"]
