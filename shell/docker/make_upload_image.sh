. ./docker_func.sh

container_id=$1
image_name=$(getImageNameFromContainer ${container_id})
if [ $# -ge 2 ];then
        image_nameD=$2;
fi
docker commit ${container_id} ${image_name}
#docker push ${image_name}
