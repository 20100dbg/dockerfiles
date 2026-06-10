FROM debian:13-slim

RUN apt update
RUN apt install -y --no-install-recommends \
        net-tools iproute2 iputils-ping nano \
        python3 pipx bash git gcc build-essential gcc-multilib \
        curl ssh netcat-openbsd socat

RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

ARG USERNAME=attacker
ARG PASSWORD=attacker

RUN useradd -m -s /bin/bash $USERNAME
RUN usermod -aG sudo $USERNAME
RUN echo "$USERNAME:$PASSWORD" | chpasswd

RUN mkdir -p /home/$USERNAME/.ssh
RUN ssh-keygen -f /home/$USERNAME/.ssh/id_rsa -q -N ""
RUN cp /home/$USERNAME/.ssh/id_rsa.pub /home/$USERNAME/.ssh/authorized_keys

WORKDIR /home/$USERNAME


RUN pipx install git+https://github.com/brightio/penelope
RUN pipx ensurepath


RUN git clone https://github.com/haad/proxychains
RUN cd proxychains && ./configure && make && make install
RUN rm -rf proxychains

RUN curl -L -O https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.3/ligolo-ng_proxy_0.8.3_linux_amd64.tar.gz
RUN curl -L -O https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.3/ligolo-ng_agent_0.8.3_linux_amd64.tar.gz

CMD ["/usr/sbin/sshd", "-D"]
