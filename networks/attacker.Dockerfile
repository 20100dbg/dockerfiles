FROM alpine:latest

RUN apk update
RUN apk add \
        net-tools iproute2 iputils-ping nano \
        python3 pipx bash git curl

RUN pipx install git+https://github.com/brightio/penelope
RUN pipx ensurepath

RUN mkdir /app
WORKDIR /app

COPY ./tools /app

CMD ["tail", "-f", "/dev/null"]
#CMD ['/bin/bash']
