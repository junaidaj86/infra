#!/bin/bash

# Define the number of shards
shards=${SHARDS:-3}

# Loop through each shard
for (( i=0; i<$shards; i++ ))
do
  # Define the shard name
  shard_name="postgres-shard-$i"
  
  # Stop and remove the container if it exists
  docker stop $shard_name >/dev/null 2>&1 || true
  docker rm $shard_name >/dev/null 2>&1 || true
  
  # Run the container with PostgreSQL
  docker run -d -p "555$i:5432" \
    --name $shard_name \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=postgres \
    -e POSTGRES_DB=postgres \
    postgres:14.3 >/dev/null 2>&1
  
  echo "PostgreSQL shard $i created and accessible via port 555$i"
done
