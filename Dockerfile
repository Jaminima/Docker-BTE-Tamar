FROM ubuntu:latest

#Install Neccessary Packages
RUN apt-get update && apt-get install -y \
    openjdk-8-jdk:amd64 \
    wget \
    dos2unix \
    p7zip-full

#Java Port
EXPOSE 25565

#------Start The Server------
RUN mkdir /minecraft-init
WORKDIR /minecraft-init

#Copy The Start Script
COPY docker-start.sh ./docker-start.sh
RUN dos2unix ./docker-start.sh
RUN chmod +x ./docker-start.sh

CMD ["/bin/bash", "/minecraft-init/docker-start.sh"]