container_id=$1
new_image_name=$2
docker commit ${container_id} ${new_image_name}
