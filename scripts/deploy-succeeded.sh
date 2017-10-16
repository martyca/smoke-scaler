#!/bin/sh
# set
apk update
apk add curl
set


curl -s --data-urlencode "payload={\"text\": \":white_check_mark: Deployment Succeeded.\", \"username\": \"$slackuser\", \"channel\": \"$slackchannel\", \"icon_emoji\": \"$slackicon\"}" $slackurl
