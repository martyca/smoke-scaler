#!/bin/bash

# timeout is iterations times duration in seconds, so 100 * 3 = 300 seconds is 5 minutes.
iterations="100"
duration="3"




cf login -a $api -u $username -p $password -o $organization -s $space

index=$(cf curl "/v2/apps" | jq '[ .resources[].entity.name ]' | jq 'index("concourse-app")')
guid=$(cf curl "/v2/apps" | jq ".resources[$index].metadata.guid" | tr -d '"')

echo $guid

while [ $i -gt 0 ]
do
  instances=$(cf curl "/v2/apps/$guid" | jq .entity.instances)
  echo "Iteration: $iterations"
  echo "Number of instances is: $instances"
  if [[ "$instances" == "1" ]]
  then
    echo "App is scaled down, exiting."
    exit 0
  fi
  sleep $duration
  iterations=$[$iterations-1]
done
echo "----------> Timed-Out!"
exit 1
