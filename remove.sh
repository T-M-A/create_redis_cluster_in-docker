#!/usr/bin/env bash
N=$1
echo "Removing $N nodes..."
for ind in `seq 1 $N`; do \
 docker rm -f  "redis-$ind"
done
