image_name=$1
CMD="/bin/bash";
if [ $# -ge 2 ];then
	CMD=$2;
fi
docker run -itd --privileged=true -p58080:8080 -v/home/docker_share:/docker_share $image_name $CMD
