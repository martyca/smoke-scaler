#!/bin/sh
# set
apk update
apk add curl
set


curl -s --data-urlencode "payload={\"text\": \":x: Scaling Failed.\", \"username\": \"$slackuser\", \"channel\": \"$slackchannel\", \"icon_emoji\": \"$slackicon\"}" $slackurl
