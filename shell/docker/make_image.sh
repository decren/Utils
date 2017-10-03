container_id=$1
CMD="/bin/bash"
if [ $# -ge 2 ];then
        CMD=$2;
fi
docker exec -it $container_id $CMD
