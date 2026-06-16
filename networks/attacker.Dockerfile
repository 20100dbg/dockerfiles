FROM debian:13-slim

RUN apt update
RUN apt install -y --no-install-recommends \
        net-tools iproute2 iputils-ping nano sudo \
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

USER $USERNAME

RUN mkdir -p /home/$USERNAME/.ssh
RUN ssh-keygen -f /home/$USERNAME/.ssh/id_rsa -q -N ""
RUN cp /home/$USERNAME/.ssh/id_rsa.pub /home/$USERNAME/.ssh/authorized_keys
WORKDIR /home/$USERNAME

RUN pipx install git+https://github.com/brightio/penelope
RUN pipx ensurepath

RUN curl -L -O https://github.com/kost/revsocks/releases/download/v2.9/revsocks_linux_amd64 ;\
    chmod +x revsocks_linux_amd64

RUN curl -L -O https://github.com/andrew-d/static-binaries/raw/refs/heads/master/binaries/linux/x86_64/socat ;\
    chmod +x socat

RUN curl -L -O https://github.com/andrew-d/static-binaries/raw/refs/heads/master/binaries/linux/x86_64/ncat ;\
    chmod +x ncat

RUN curl -L -O https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.3/ligolo-ng_proxy_0.8.3_linux_amd64.tar.gz ;\
    gzip -d ligolo-ng_proxy_0.8.3_linux_amd64.tar.gz ;\
    tar xvf ligolo-ng_proxy_0.8.3_linux_amd64.tar ;\
    rm ligolo-ng_proxy_0.8.3_linux_amd64.tar

RUN curl -L -O https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.3/ligolo-ng_agent_0.8.3_linux_amd64.tar.gz ;\
    gzip -d ligolo-ng_agent_0.8.3_linux_amd64.tar.gz ;\
    tar xvf ligolo-ng_agent_0.8.3_linux_amd64.tar ;\
    rm ligolo-ng_agent_0.8.3_linux_amd64.tar

RUN rm README.md LICENSE


RUN git clone https://github.com/haad/proxychains
USER root
RUN cd proxychains && ./configure && make && sudo make install
RUN rm -rf proxychains

COPY genshell.py /home/$USERNAME
RUN chown $USERNAME:$USERNAME /home/$USERNAME/genshell.py
RUN chmod +x /home/$USERNAME/genshell.py
CMD ["/usr/sbin/sshd", "-D"]
