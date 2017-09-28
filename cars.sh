#!/bin/bash
# Script to process list of cars. They are to be grouped by country and then sorted by name in descending order. The resulting json is then uploaded to s3.

json=$(
  curl 'http://www.carqueryapi.com/api/0.3/?cmd=getMakes' -H 'User-Agent: Carla'
)

echo $json | jq '.Makes|group_by(.make_country)| map(length as $l | sort_by(.make_id)| reverse | map(. + {carsReleasedInCountry: $l}))' >> cars.json

aws s3 cp cars.json s3://bugcrowd-infrastructure-interview/CarlaCastro/cars.json --profile bugcrowd
