FROM debian:13-slim

RUN apt update
RUN apt install -y --no-install-recommends \
        net-tools iproute2 iputils-ping nano \
        python3 pipx bash git gcc build-essential gcc-multilib \
        curl ssh netcat-openbsd socat

RUN pipx install git+https://github.com/brightio/penelope
RUN pipx ensurepath

RUN mkdir /app
WORKDIR /app

RUN git clone https://github.com/haad/proxychains
RUN cd proxychains && ./configure && make && make install
RUN rm -rf proxychains

COPY ./tools /app

CMD ["tail", "-f", "/dev/null"]
