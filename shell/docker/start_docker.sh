image_name=$1
CMD="/bin/bash";
if [ $# -ge 2 ];then
	CMD=$2;
fi
docker run -itd --privileged=true -v /home/docker_share:/docker_share $image_name $CMD
