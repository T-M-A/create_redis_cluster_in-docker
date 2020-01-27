#!/usr/bin/env bash
N=$1
echo "Creating $N nodes with password xxx" 
for ind in `seq 1 $N`; do \
docker run -d --net=host  --restart=always\
 -v /root/redis-cluster/redis$ind.conf:/usr/local/etc/redis/redis.conf \
 --name "redis-$ind" \
 redis redis-server /usr/local/etc/redis/redis.conf; \
done
xxx=' -a xxx --cluster create --cluster-replicas 1 '"$(for ind in `seq 1 6`; do echo -n " $(hostname -i):900$ind"; done) "
echo " Parametrs for create cluster: $xxx"
redis-cli $xxx
