FROM ubuntu:latest

#Install Neccessary Packages
RUN apt-get update && apt-get install -y \
    openjdk-8-jdk \
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

#Download the forge files
COPY ./forge/ /minecraft-init/

#Run the server for the first time to generate the eula
RUN java -Xmx1024M -Xms1024M -jar forge-1.12.2-14.23.5.2859.jar nogui

#Accept the eula
RUN echo "eula=true" > /minecraft-init/eula.txt

#------Start The Server------

#Copy The Start Script
COPY docker-start.sh ./docker-start.sh
RUN dos2unix ./docker-start.sh
RUN chmod +x ./docker-start.sh

CMD ["/bin/bash", "/minecraft-init/docker-start.sh"]