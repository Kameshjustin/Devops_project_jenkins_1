#!/bin/bash
docker stop python_app || true 
docker rm python_app || true 
docker run -d -p 5000:5000 --name 
python_app python -jenkins-app 