FROM ubuntu
RUN apt-get update
RUN apt-get install sudo
RUN adduser --disabled-password --gecos '' pykid
RUN adduser pykid sudo
RUN echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER pykid
RUN sudo apt-get install apache2 -y
