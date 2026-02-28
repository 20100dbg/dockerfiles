#!/bin/bash

docker stop flask_container
docker rm flask_container

docker run -it --name flask_container --mount type=bind,src=./www,dst=/app/www -p8080:80 flask:latest