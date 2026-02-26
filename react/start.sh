#!/bin/bash

#docker run -d --name react_container --mount type=bind,src=./app,dst=/app -p5173:5173 react:latest

docker run -it --name react_container --mount type=bind,src=./app,dst=/app -p5173:5173 react:latest