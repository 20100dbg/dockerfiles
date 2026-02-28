# Nginx + Flask + Gunicorn + gevent + socketio

## Build
docker build -t flask .

## Run
docker run -it --name flask_container --mount type=bind,src=./www,dst=/app/www -p8080:80 flask:latest
