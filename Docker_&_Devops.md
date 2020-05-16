# Docker @ Ashu sir

## Notes
* Name of Mac OS kernel is : Darwin
* DNS stands for Domain Name System
* Check public Ip from linux terminal using ```curl ifconfig.me```
* cgroups can limit the resources provided to a container
* namespace is responsible for container isolation
* Kubernetes is Container Run Time Engine
* Mercurial is an example of distributed version system
* Jenkins is written in Java(Pure)
* To Add pass to a user , run
    ```echo "my-user-passwd" | passwd user-name --stdin```
* The sudoers file name can be anything just its locaition should be ````/etc/sudoers.d```

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

```yaml
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
   - '11111:80`
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

## Docker Compose integration with DockerFile
* Dockerfile
```bash
FROM centos
MAINTAINER pykid
ENV x=web1
RUN dnf install httpd -y
# you can use instead of yum
ADD web1 /var/www/html
ENTRYPOINT httpd -DFOREGROUND
```
* Docker-compose
```yaml
version: '3.8'
services:
 app1:
  image: image-name-to-be-build # basically write the name of image supposed to be build from docker file
  build: .  # location of docker file
  container_name: pykidc1  # optional : if not given a random name is taken
  ports:
   - "9991:80"
```

* if docker file name is not ```Dockerfile```
```yaml
version: '3.8'
services:
 app1:
  image: image-name-to-be-build # basically write the name of image supposed to be build from docker file
  build: 
   context: . #location of docker file
   dockerfile: file-name # name of docker file
  container_name: pykidc1  # optional : if not given a random name is taken
  ports:
   - "9991:80"
  network:
   - network-name # i want to use this bride but this is not present as of now
  volume:
   - vol-name:/path-to-attach

networks:
 network-name:   # this will create a network of this name
volumes:
 vol-name:     # this will create new volume
```
* If image is present already build then docker-compose will not build it again
* But to rebuild the image, just use code
    ```docker-compose up --build -d ```


* docker run -itd --name webui -p 8388:9000 -v /var/run/docker.sock:/var/run/docker.sock   portainer/portainer
* portainer's port no is 9000

## Database Containers
* Environment variables can be setup for easy database settings
* ```-e``` is given for setting Environment Variables
* ```mysql -u root -ppassword``` can be used to open mysql
* In compose file, we can write a keyword ```depends_on:``` to make one service wait for another service to be ready

```yaml
version: '3.8'
services: 
 db:
  image: mysql
  command: --default-authentication-plugin:mysql_native_password
  restart: always
  environment:
   MYSQL_ROOT_PASSWORD: redhat

adminer:
  image: adminer
  restart: always
  depends_on:
   - db
   - another-service-name
  ports:
   - 8080:8080
```

## ASSIGNMENT
1. 
    * Create A docker image with DJango/flask/html website and simple form in container
    * Create another docker image for db and connect both
2. Crate a container that can be used to create more containers
    ```docker run -ti -v /var/run/docker.sock:/var/run/docker.sock docker``` uses image of docker not recommended
3. Container is to be created for a website and when some change is created in the website, the container should be updated as well itself (using watch-tower)
4. Write a Dockerfile
    * Install httpd / nginx server
    * Run httpd process from a non-root user


# Continuous Integration / Continuous Development(Delivery) 

## CI Tools                     ## CD Tools 
1. gitlab                       1. Spinkar
2. hudson                       2. Jenkins
3. teamcity
4. jenkins

# JENKINS

## Jenkins Installation
* Follow ```wiki.jenkins.io``` website for proper installation
* Always prefer ```Long Term Support(LTS) versions```
* You need java (8+) 
    * JDK Support
* For Ubuntu
```sh
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo add-apt-repository universe
sudo apt-get install jenkins
```
* To Start service ```systemctl start jenkins```
* To Enable service ```systemctl enable jenkins```
* Database location of jenkins is ```/var/lib/jenkins```
* Jenkins can be accessed through 2 ways:
    1. CLI
    2. Web UI(127.0.0.1:8080)
* Run jenkins in a container
* To find all files in ubuntu run the command,
    ```dpkg -s jenkins```
* The configuration file for jenkins is ```/etc/sysconfig/jenkins```
* Through configuration we can check/change the port/user/other default configurations for jenkins
* To check the port no boundation in os ```ss -nlpt``` or ```netstat -nlpt```
* jenkins is just a jvm process running in backend
* jenkins for docker
```sh
docker run -itd --name jenkins1 -p 8080:8080 -v /var/jenkins_home ticketfly/jenkins-example-gradle-build
```

## Jenkins with Docker
* By default, jenkins and docker can not communicate with each other
* These both are daemons access to admin over an operating system but not connected together
* To configure communication between both, add jenkins user to docker group by ```sudo usermod -aG docker jenkins```

## Project
* To start any project in jenkins or use its CI/CD service , we have following general steps:
    1. Open the WEB GUI host ```127.0.0.1:8080```
    2. Click on create new
    3. Write description of project
    3. Add files/code to work on
    4. Set / Build trigers
    5. Click on Build Now in left panel
* The status of success/failure/pending is displayed through weather emoji's ```sunny the better```
* Poll SCM ~> It is a service that can be configured in jenkins panel which lets the jenkin keep a check of git repo update at specific interval of time

* Crontab Syntax ```minutes hr date month day```
* Example for every month at 9:30 ```30 9 1 * * ```
* Every 15 minute   ```*/15 * * * *```
* Every minute ```* * * * *```


* Jenkins can be connected to multiple host docker engines using ansible


# Ansible 
* It can be used to automate
    1. Linux Servers
    2. Windows Servers
    3. Cloud Servers
    4. Cisco Devices
    5. VmWare Devices
    6. Kubernetes
               and many more..
* Can only be installed on Linux Based OS
* It uses connectors to connect with different serers:
    1. ssh ~ linux
    2. WInRn ~ Windows
    3. NetConf / NetworkCLI ~ Cisco

## Ansible Syntax
* For /etc/ansible/hosts
```
[group-name]
ip-1
ip-2
34.238.124.194

[group-name2]
ip-3
ip-1
```
* Working Workflow
Ansible ~> Configure file ~> Inventory ~> ssh ~> Parallel to all systems
where, inventory file = /etc/ansible/host
* to run simple adhoc command ``` ansible group-name1,group-name2 -u user-name -m ping -k```
* ```-k``` ~> to take password
* To get the list modules ```ansible-doc -l```
* Its not a service based tool
* Ansible Playbook
```yaml
 - hosts: group-name
   remote_user: adhoc  # this is the target machine user
   tasks:
    - name: want to run date command
      command: date
    - name: create directory
      command: mkdir /tmp/google    # another-module
```
* To run playbook ```ansible-playbook file-name.yaml -k```


## Module Examples
```yaml
---
 - hosts: localhost
   tasks:
    - name: running date command
      command: date     # i am using date command to run locally
    
    - name: print hello world essage
      debug: msg="hello world"
```

```yaml
---
 - hosts: localhost
   tasks:
    - name: installing httpd server
      yum: name=httpd state=present

    - name: starting service        # real OS not containers
      service: name=httpd  state=started

    - name: to start httpd service for containers
      shell: httpd -DFOREGROUND

```

```yaml
---
 - hosts: localhost
   vars:
    x: httpd
    y: hello
   tasks:
    - name: installing httpd
      yum: 
       name: "{{ x }}" # calling ansible variables
       state: present

    - name: start service in Real OS
      service:
       name: "{{ x }}"
       state: started

    - name:  starting service in container
      shell: httpd -DFOREGROUND
```

* To virtually run/ execute any playbook, that is not to have any changes to system byt still execute playbook , we use command
 ```ansible-playbook -C playbook-name.yml ```

```yaml
---
 - hosts: localhost
   tasks:
    - name: installing frp software
      yum:
       name: ftp
       state: present
    
    - name: checking current time
      command: date
      register: x  # to store the output of connected modules

    - name: print the value of x
      debug: var=x

    - name: print only specific output with stdout
      debug: var=x.stdout

```

* only one debug can run in 1 line and if more then one are given then only the latest will be executed


# Kubernetes
* Designed by ```Google``` using ```GO Language``` introduced in around 2014.
* This product was donated to CNCF and is pure open-source
<a href="https://kubernetes.io"> Official Docs </a>

## Things required to be Taken Care in Production
1. Security
2. Downtime
3. Upgradation ~> process must be smooth
4. Portability(with respect to Code) + Migration(with respect to complete server)
5. AutoScaling
6. Superfast Deployment ( Easy to Deploy )



## Architecture and Components of Kubernetes
* Requirement:
    1. Master ~> Linux Bases
    2. Minions ~> Linux or Windows
* <u>Control-Plane</u> ~> All the components discussed below are together called the ```Control Plane Components```
* <u>Container Orchestration</u> ~> A Tool that can manage the various containers in run time
e.g., Docker SWARM , Dokku , Apache Mesos , Kubernetes(K8S)
* Every minion should have docker installed
* <u>Kubernetes-Cluster</u> : Combination of Master and Minions all together
* <u>Kube-API Server</u> : Present in Master Server,request send by kubectl are received by it thus it acts as an ```end-point``` for management or any other activity over Kubernetes-Cluster
* <u>Kube-Scheduler</u> : It receives requests from ```Kube-APIServer``` to initialise a POD and it checks for the best MINION to get it done (by usings reports taken from ```Node Controller```) and schedule the task
* <u>Node Controller</u> : Checks the health of minion nodes ~> Has enough resources,add new minion at real time,disconnect minion
* <u>Replication Controller</u> : It connects with ```Kube-Scheduler``` to maintain and initialise a count of containers decided at the beginning.Basically it keeps a count of ```no. of containers launched per image```

* <u>Kube-Proxy</u> : kube-proxy is a network proxy that runs on each node in your cluster and maintains ```network rules``` on nodes. These network rules allow network-communication between your Pods from network sessions inside or outside of your cluster that is kube-proxy decided as ```which pod can communicate to which node```

* <u>ETCD</u> : 
    1. Database server (most powerfull) ~> Stored the complete status(Healthy/Unhealthy/UP/Down/Running) of Minions ~> Stores data in key:value pair ~> Runs in Master Node ~> Using NOSQL ~> Brain of Kubernetes(most important)
    2. It can be made separetly outside from Kubernetes-Cluster thus it is not a part of ```Kubernetes Control Plane```
    3. It gets its data(Input) through ```KubeAPIServer```
* <u>Kubelet</u> ~> It is the end-point of communication present in all the minions.Any communication done by KubeAPIServer is done through Kubelet as it communicates any/all information from inside the minion(Docker Engine/Pods) to outside world
* Kubernetes can not use Docker Networking across Minions as that can cause ip-conflict
* As a solution we are gonna build our own bridge (Common Bridge Technology) that will be connected to each ```Docker Engine``` and will be  ```providing ip``` to each container
* Even the Master Node will also be connected with the above ```CBT```
e.g., ```Calico```,Flannel,ACL,CiscoASI,Calloin,Weave


# Installation of K8S Cluster
## Type of Installation
1. Single Node Kubernetes Cluster : Only 1 Physical server with both Master as well as Minion ( Testing purpose )
    * <a href="https://www.youtube.com/watch?v=TTzbQdu30YA"> Installation Video </a>
    * <a href="https://github.com/redashu/k8s.git"> Installation Docs </a>
2. Multi Node K8S Cluster : platform independent
    * 1 Master + N Minions
    * N Master + N Minions
3. Kubernetes as a Service: Cloud providers like AWS( EKS ),Google(GKE),Azure(AKS),Oracle Cloud(OKE), VMWare Cloud, Alibaba


## MiniKube
* It provides an automated way for Installation of Single Node K8S Cluster
* It can use VMWare/VirtualBox/KVM/Hyper-V/Docker
* Download from official docs website
* Give Execution permission ```chmod +x /usr/bin/minikube```
* In Linux run ```minikube start --vm-driver=virtualbox``` to start minikube in Linux virtual box
(25 ~ 30 min to get kubernetes cluster ready)
* Kubectl(client side software) ~> Can be used using CMD,Powershell,Terminal : A CLI tool to connect with Kubernetes
* Minikube provides self authentication where as for master access deployed on AWS we need ```admin.conf``` that can be get using ```wget http://master-ip/admin.cnf```
* And we need to change the server private ip of ```admin.cnf``` to an public ip.
* To get list of working nodes: ```kubectl get nodes``` 
* To get list of working nodes for all nodes through master: ```kubectl get nodes --kubeconfig admin.conf```
* To get access of minikube, we can run ```minikube ssh```

# POD
* Created using Docker Image through Kubernetes
* Applications are executed over ```POD```
* Architecture  
Kubectl Communicates with----------> K8S
                                    Docker
                                      OS
* When Docker creates container it attaches IP,MAC,CPU,RAM etc but when K8S creates container using Docker, then it doesn't attach those things through docker and rather get it done by itself
* It has IP+MAC+CPU(RAM) with Application
* A Pod encapsulates an application’s container (or, in some cases, multiple containers), storage resources, a unique network identity (IP address), as well as options that govern how the container(s) should run. 

## Creating POD
* Can be Created using ```YAML``` and ```JSON```
* APIVersion,Kind,Metadata,Spec are the keywords required in ```YAML``` file of POD
* POD file
```yaml
apiVersion:v1
kind: Pod  # here P is caps
metadata:    # some info about pod
 name: piyushagarwal    # this is my pod name 
 labels:           
  x: y     # label is important if you want traffic to reach to specific port and it gets unique key:value
spec:
 containers:    # about my docker image and container info
  - name: pykidc1   # name of my container
    image: nginx     # image from docker hub (only) it doesn't take from local
    ports:
     - containerPort: 80  # same as expose in Dockerfile
```
* To run the POD ```kubectl create -f file-name.yml```
* To check POD ```kubectl get pods```
* To Delete POD ```kubectl delete pod pod-name``` or ```kubectl delete pods --all```
* To watch live status of PODs ```kubectl get pods -w```
* To get IP Address of POD ```kubectl get pods -o wide```
* To get detailed information about POD ```kubectl describe pods pod-name```
* To get detailed info about PODS / how to work with them , use command ```kubectl explain pods```, it justs like ```man``` for linux
* To check value of apiVersion ```kubectl explain pods.apiVersion```
* To check value of kind ```kubectl explain pods.kind```
* To check value of spec ```kubectl explain pods.spec```
* To check value of containers ```kubectl explain pods.spec.containers```
* To check output, but not actually bring any changes we use the command ```--dry-run```
* To create POD file using command and not create POD itself
```kubectl run pod-name --image=image-name --port port-no --restart Never --dry-run -o yaml```
* To create POD using command ```kubectl run pod-name --image=imagename --restart Never```
* To check pod label ```kubectl get pods --show-labels```
* Every Node (Minion/Master) has a ```Kubelet``` which is the point communication between nodes , if it accepts the requests from ```Kube Scheduler``` then the request will be sent to Docker Engine and a container will be initialised

1. Client Uses ```Kubectl``` : (create POD)
2. Request get sent to Kube-API Server (Process)
3. Above Request is send to Kube-Scheduler : Search for best minion to get pod running
4. Kube Scheduler sends request to ```Kubelet``` of one of the minions
5. If above request is processed successfully then information regarding complete deployment,current status is sent back to API Server.

## Create vs Apply
* Create always makes a new POD
* Apply will check if its present or not
    1. If present then update it (if possible)
    2. Else create it

Note: A running POD can not be updated with a port number


# Service
* IP address of a pod / application running inside a pod can not be accessed from outside the Kubernetes Cluster
* Service ~> They have static ip and it identifies ports using
    1. IP (less efficient due to dynamic ip)
    2. Name
    3. Labels (key:value)
* Services is of 4 types:
    1. ClusterIP
    2. NodePort : user use nodeport that assigns a unique port(randomly generated) to service ip which can further access the applications
    3. LoadBalancer
    4. External Name
* Service ip is not reachable to outside user
* User can only access Master-Ip(not recommended) or Worker IP

## Creating Service
```yaml
apiVersion: v1
kind: Service
metadata:
 name: myservice1

spec:
 ports:
  - name: mysvcport    # optional field
    port: 1122     # this is must and is the port of service IP
    targetPort: 80  # this much match the port number of POD
    protocol: TCP    # optional field
 selector:
  x: hello    # this label must be same as pod label to which traffic is to be forwarded
 type: NodePort
```

* to create the service file ```kubectl create -f service-file.yaml```
* To get list of services ```kubectl get services```






