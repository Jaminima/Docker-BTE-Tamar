FROM ubuntu:latest

#Install Neccessary Packages
RUN apt-get update && apt-get install -y \
    openjdk-21-jdk \
    wget \
    dos2unix \
    p7zip-full

#Java Port
EXPOSE 25565

#------Configure Minecraft Server------

#Create a directory for the server
RUN mkdir /minecraft-init
RUN chmod 777 /minecraft-init

WORKDIR /minecraft-init

#Run the server for the first time to generate the eula
RUN wget -O /minecraft-init/fabric.jar https://meta.fabricmc.net/v2/versions/loader/1.21.1/0.16.9/1.0.1/server/jar

#Run the server for the first time to generate the eula
RUN java -jar fabric.jar

#Accept the eula
RUN echo "eula=true" > /minecraft-init/eula.txt

#------Start The Server------

#Copy The Start Script
COPY docker-start.sh ./docker-start.sh
RUN dos2unix ./docker-start.sh
RUN chmod +x ./docker-start.sh

CMD ["/bin/bash", "/minecraft-init/docker-start.sh"]