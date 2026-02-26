FROM debian:13.0-slim

RUN apt-get update && \
    apt-get install nano npm nodejs \
    -y --allow-unauthenticated

RUN mkdir /app

RUN chown 1000:1000 /app

WORKDIR /app

EXPOSE 5173

#RUN npm create vite@latest app-test -- --template react -i

#USER 1000:1000

#CMD ['npm', 'run', 'dev']

#CMD /bin/bash