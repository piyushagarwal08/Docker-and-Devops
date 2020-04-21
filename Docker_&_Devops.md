# Docker @ Ashu sir

## Notes
* Name of Mac OS kernel is : Darwin
* DNS stands for Domain Name System
* Check public Ip from linux terminal using ```curl ifconfig.me```
* cgroups can limit the resources provided to a container
* namespace is responsible for container isolation
* Kubernetes is Container Run Time Engine

## Docker Images
* These can be build using 3 methods
    1. Manual
    2. DockerFile
    3. Buildah
* To Integrate DockerFile with some programming code:
    1. Create your program
    2. Create a File called ```DockerFile```
    3. Contents of DockerFile are not case sensitive
    ```
    FROM python # it will check for python image in docker engine if not present then will pull from docker hub
    MAINTAINER piyushagarwal.0108@gmail.com , pykid # Developer of Docker Image, keyword is optional
    RUN mkdir /mycode # This run instruction can execute any linux command inside my docker image that i am going to create
    COPY file-name-with-extension /mycode/file-name-with-extension # it will copy code from local system to docker image
    CMD python /mycode/file-name-with-extension # this will run the code as default parent process
    ```
* ```docker build -t name:version -f Dockerfile.txt .```

* Port Forwarding ~> A way to forward the user from ```ip:port``` to a specific container

* Never create different images of same code,instead merge the new and old one

* ```docker history imagename:version``` ~> used to check the history of all commits in docker image

* ```ENV ``` this tag is used in dockerfile to set certain variable environment
* ```.dockerignore``` ~> A file read by Dockerfile which states that which files are not to be copied that is it restricts Dockerfile to copy data from your current directory
* to check the values of current environment variables we use the command
```docker exec -it container-name env```
* ``` -e ``` is used to change the environment variables

## Docker Networking
* By networking the containers can communicate with each other with being isolated from each other
* ```docker inspect container-name``` used to check ip of container
* When install Docker for the first time, 3 Docker bridges are created by default
* Out of these 3, one bridge is named ```docker0``` given by OS and docker has named these 3 bridges as
    1. Bridge (default)
    2. host
    3. None
* To check present docker bridges 
    ```docker network ls```
* To remove non-default bridges
    ```docker network rm $(docker network -q)```
* Containers use the ```host ip``` to connect to internet that is the outside world and this feature of netwrok addressing is called ```Network Addressing Translation```
* If we want that, container do not to default network bridge, we use the command
    ``` docker run -itd --name t5 --nework host alpine sh ```

* Containers can be configured that even being on same host , they can not communicate to each other that is possible by creating self customized containers

* To create a new network, run the command
    ```docker network create network-name```


```
FROM java
maintainer piyush
env classname=devops
# optional
run mkdir /codes
add devops.java /codes/devops.java
workdir /codes/
# changes the directory
RUN javac devops.java
# executes the java object file
CMD java devops
```

<u> CMD </u>
```
FROM alpine
maintainer piyush
cmd cal
```
* If we give some command then it runs it else runs the pre defined command

<u> EntryPoint </u>
```
FROM alpine
maintainer piyush
Entrypoint cal
```

* If we give or not give some command, the cal command will run always

## Add vs Copy
* Add can be used to add URL directly to the Dockerfile
* Copy can not be used for the same
* Both works similar when we try to copy data from local system


## Docker Hub
* To upload any image over docker hub, we need
    1. docker login
    2. image to be tagged
* To tag image use
    ```docker image tag image-name:version user-name/imagename:version```
* To Push or pull images
    ```docker push user-name/imagename:version```


# Docker Storage
1. Docker Engine ~> by defaults reads and writes data in ```/var/lib/docker```
2. Containers

* Containers are ephemerial/non-persistent in nature that is as soon as container is removed, data is also lost


## Docker Volume
* command to create volume is
    ```docker volume create vol-name```
* check volume using ```docker volume ls```

* To attach a volume
    ```docker run -it --name name -v vol-name:/myimpdata image-name cmd-to-run```
* To check volume
    ```docker volume inspect vol-name```

* To share or use a folder in containers, we can use
    ```docker run -it --name name -v folder-path:/folder-to-mount image-name  cmd-to-run```
* even a file can also be mounted as storage place.
* more then one volume can also be mounted as
```docker run -it --name name -v folder-path:/folder-to-mount -v folder-path1:/folder1-to-mount image-name  cmd-to-run```


# Docker Compose
* It relies on Docker engine
* It is a file based approach which can be written in ```YAML``` and ```JSON```
* YAML ~> Yet Another Markup Language
* JSON ~> JavaScript Object Notation
* To check if ```compose``` is installed, check by running
    ```docker-compose```
* If compose is not present,download the script from ```docs.docker.com``` and make it executable using root permissions.
* Docker compose is required/installed on client side

## Versions
### 1. <u>Version1</u>
* By default, containers are deployed into default bridge
* This version is no more available
### 2. <u>Version2</u>
* New Docker network is create
* Requirement:
    * Empty Directory
    * Network of container will be same as of directory, so directory names should be unique
    * File name should be ```docker-compose.yaml``` or ```docker-compose.yml``` or ```docker.json```

### 3. <u>Version3</u>
    * New Docker network is created

## Compose File
* Everything is written in key:value pair
* It has 4 Sections
1. Version ~> 2.x or 3.x
2. Services ~> containers information
3. Network (Optional)
4. Volume (Optional)

```
version: '3.5'
services:
 ashuapp11: #service name
  image: alpine    # image name
  container_name: ashuc11   # container name
  command: ping fb.com    # parent-process

 ashuapp12:
  image: alpine
  container_name: ashuc12
  command: ping google.com
```
* To start this compose file, network and container gets created
    ```docker-compose up -d```
* To show container
    ```docker-compose ps```
* To stop - remove everything
    ```docker-compose down```
* To kill container,all the containers will be exited not removed (forcefully)
    ```docker-compose kill```
* To stop container - not remove it (gracefully)
    ```docker-compose stop```
* To initiate only specific service
    ```docker-compose up -d service-name```
* To define a compose file with another name
    ```docker-compose -f file-name.yml up -d```

* example 2
```yaml
version: '3.8'
services:
 ashuwebapp1:
  image: dockerashu/ckad:v2
  container_name: ashucccc
  ports:
     '11111:80`
```

Notes: 
* :set shiftwidth=1 ~> in vim can set enter space equal to 1
* syntax in compose file
``` 
    version:<space>'version-name'
    services:
    <space>app1:
    <space><space>about it
```
* using docker-compose stop is preferable
* network-name is same as folder name in which it is created.

