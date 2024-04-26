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
  
  echo "PostgreSQL shard $i removed"
done
