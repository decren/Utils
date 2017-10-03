function getImageNameFromContainer()
{
	docker inspect $1 | grep Image|grep image_name_key |awk '{print $2}'|awk -F'"' '{print $2}'
}

getImageNameFromContainer container_name
