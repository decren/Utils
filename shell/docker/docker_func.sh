function getImageNameFromContainer()
{
	docker inspect $1 | grep Image|grep decren|awk '{print $2}'|awk -F'"' '{print $2}'
}

getImageNameFromContainer b070cc8c1db3
