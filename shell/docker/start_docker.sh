function help()
{
	echo "please input image_name container_name"
}

if [ $# -lt 2 ];then
	help
	exit -1;
fi

image_name=$1
container_name=$2
CMD="/bin/bash";
docker run --name ${container_name} -itd --privileged=true -p58080:8080 -v/home/docker_share:/docker_share $image_name $CMD
