#!/bin/sh
# set

cf login -a $api -u $username -p $password -o $organization -s $space &&\
cd ./this-git-repo/webapp/ &&\
cf push &&\
cf map-route concourse-app-staged $domain --hostname $route &&\
cf delete concourse-app -f &&\
cf rename concourse-app-staged concourse-app
