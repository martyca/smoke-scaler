#!/bin/sh
# set

cf login -a $api -u $username -p $password -o $organization -s $space &&\
cd ./this-git-repo/webapp/ &&\
cf push &&\
cf map-route $route $domain --hostname rws-concourse-test &&\
cf delete concourse-app -f &&\
cf rename concourse-app-staged concourse-app
