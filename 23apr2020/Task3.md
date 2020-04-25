## Container is to be created for a website and when some change is created in the website, the container should be updated as well itself

* This Task can be done using ```WatchTower```
* pull command
 ```docker pull v2tec/watchtower```
* Run the container
 ```sh
 docker run -d \
  --name watchtower \
  -v /var/run/docker.sock:/var/run/docker.sock \
  v2tec/watchtower
 ```
* When no arguments are specified, watchtower will monitor all running containers.
* If a new version of the v2tec/watchtower image is pushed to the Docker Hub, your watchtower will pull down the new image and restart itself automatically.
<bold>(Not Recommended for Production)</bold>