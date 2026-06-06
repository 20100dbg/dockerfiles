FROM debian:9.0

RUN echo "deb http://archive.debian.org/debian/ stretch contrib main non-free" > /etc/apt/sources.list

RUN apt-get update && \
    apt-get install python2.7 nano \
    -y --allow-unauthenticated


CMD python2.7
