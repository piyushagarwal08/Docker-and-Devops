## Crate a container that can be used to create more containers
    
```sh
docker run -ti -v /var/run/docker.sock:/var/run/docker.sock docker
```
* uses image of docker not recommended in production
* will connect the container with host docker