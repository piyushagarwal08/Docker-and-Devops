# Create the Dockerfile using ubuntu as
```sh
FROM ubuntu
MAINTAINER piyushagarwal.0108@gmail.com
RUN apt-get update
RUN apt install ansible -y
RUN apt install docker.io -y
COPY container.sh ./
```

# Create Container.sh for launching containers
```sh
#!/bin/bash
count = 1
while [ $count -le 10 ]
do
docker container run -d --name alpine$count alpine fb.com
((count++))
done
```

* Build Docker image as ```docker image build -t ansible_docker .```
* Launch container as ```docker container run -it -v /var/run/docker.sock:/var/run/docker.sock --name ansible_docker ansible_docker bash```

# Create Ansible Playbook : container.yaml
```yaml
---
 - hosts:
   tasks:
    - name: Running 10 containers for ping command
      script: ./containers.sh
```
* Run the playbook using command ````ansible-playbook container.yaml```
* To check the containers running use the command ```docker ps```
