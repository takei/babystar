#!/bin/sh
JENKINS_HOST=172.29.86.21/jenkins
PROJECT_NAME=BabyStar
USER=shimizu
API_TOKEN=8c1edf1b5858847d358ee9e1699b4fa7
PROJECT_TOKEN=babystar
BRANCH=$1
wget --quiet --spider --no-proxy --auth-no-challenge --http-user=$USER --http-password=$API_TOKEN "http://$JENKINS_HOST/job/$PROJECT_NAME/buildWithParameters?branch=$BRANCH&token=$PROJECT_TOKEN"

