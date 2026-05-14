FROM debian:13.0-slim

RUN apt-get update && \
    apt-get install nano npm nodejs \
    -y --allow-unauthenticated

RUN mkdir /app

RUN chown 1000:1000 /app
RUN useradd -u 1000 -ms /bin/bash user
USER 1000:1000

WORKDIR /app

EXPOSE 5173


#RUN npm create vite@latest app-test -- --template react -i
#CMD ['npm', 'run', 'dev']

#RUN npx create-react-app app-test
#CMD ['npm', 'start']
