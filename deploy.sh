#!/bin/bash
if [ "$(docker ps -q -f name=python_app)" ]; then
    docker stop python_app
fi

if [ "$(docker ps -aq -f name=python_app)" ]; then
    docker rm python_app
fi

docker run -d --name python_app -p 5000:5000 python-jenkins-app
