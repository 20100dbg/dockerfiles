FROM debian:13-slim

RUN apt update
RUN apt install -y --no-install-recommends \
        net-tools iproute2 iputils-ping nano sudo \
        python3 pipx bash git gcc build-essential gcc-multilib \
        curl ssh netcat-openbsd socat tmux proxychains4

RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

ARG USERNAME=attacker
ARG PASSWORD=attacker
RUN useradd -m -s /bin/bash $USERNAME
RUN usermod -aG sudo $USERNAME
RUN echo "$USERNAME:$PASSWORD" | chpasswd

RUN mkdir -p /root/.ssh
RUN ssh-keygen -f /root/.ssh/id_rsa -q -N ""
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

USER $USERNAME
WORKDIR /home/$USERNAME

RUN mkdir -p ./.ssh
RUN ssh-keygen -f ./.ssh/id_rsa -q -N ""
RUN cp ./.ssh/id_rsa.pub ./.ssh/authorized_keys


RUN pipx install git+https://github.com/brightio/penelope
RUN pipx ensurepath

RUN curl -o revsocks -L https://github.com/kost/revsocks/releases/download/v2.9/revsocks_linux_amd64 && \
    chmod +x revsocks

RUN curl -L -O https://github.com/andrew-d/static-binaries/raw/refs/heads/master/binaries/linux/x86_64/socat && \
    chmod +x socat

RUN curl -L -O https://github.com/Fahrj/reverse-ssh/releases/download/v1.2.0/reverse-sshx64 && \
    chmod +x reverse-sshx64

RUN curl -L -O https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.3/ligolo-ng_proxy_0.8.3_linux_amd64.tar.gz && \
    gzip -d ligolo-ng_proxy_0.8.3_linux_amd64.tar.gz && \
    tar xvf ligolo-ng_proxy_0.8.3_linux_amd64.tar && \
    rm ligolo-ng_proxy_0.8.3_linux_amd64.tar

RUN curl -L -O https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.3/ligolo-ng_agent_0.8.3_linux_amd64.tar.gz && \
    gzip -d ligolo-ng_agent_0.8.3_linux_amd64.tar.gz && \
    tar xvf ligolo-ng_agent_0.8.3_linux_amd64.tar && \
    rm ligolo-ng_agent_0.8.3_linux_amd64.tar


RUN rm README.md LICENSE

RUN grep -o '^[^#]*' /etc/proxychains4.conf > ./proxychains.conf
COPY genshell.py ./
RUN echo 'alias pc=proxychains4' >> ~/.bashrc

USER root
CMD ["/usr/sbin/sshd", "-D"]
