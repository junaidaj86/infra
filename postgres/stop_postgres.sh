#!/bin/bash

# Define the number of shards
shards=${SHARDS:-3}

# Loop through each shard
for (( i=0; i<$shards; i++ ))
do
  # Define the shard name
  shard_name="postgres-shard-$i"
  
  # Stop the container if it exists
  docker stop $shard_name >/dev/null 2>&1
  
  echo "PostgreSQL shard $i stopped"
done
