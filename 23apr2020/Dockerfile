FROM ubuntu
RUN apt-get update
RUN apt-get install sudo
RUN adduser --disabled-password --gecos '' pykid
RUN usermod -aG sudo pykid
RUN echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER pykid
