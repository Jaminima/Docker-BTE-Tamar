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

#Download the paper jar
RUN wget -O /minecraft-init/fabric.jar https://meta.fabricmc.net/v2/versions/loader/1.20.1/0.16.7/1.0.1/server/jar

#Run the server for the first time to generate the eula
RUN java -jar fabric.jar

#Accept the eula
RUN echo "eula=true" > /minecraft-init/eula.txt

#------Mods------

RUN wget -O /minecraft-init/modpack.zip https://download1500.mediafire.com/pgarv7iwejegJSxtpkNbm-XqvnivurMMhtK-dP8xx4T7t_hwYihCVyJAlFcFTowdUGU-wHKrCKKYkgg7bNjanAHVE-4KsbxTbRC-HAf60W1uRtlMMJJrCO9dY4KimliGsAWH4wwUURPR9EfaTDq7vOy2b50e_Ak7Hbb0pJ5_rc8DH6w/fbgu0v89p762v45/Create_%26_Explore_1.20.1_v1.zip

#Unzip the modpack into minecraft-init
RUN 7z x modpack.zip -o/minecraft-init

#Remove the zip file
RUN rm modpack.zip

#------Start The Server------

#Copy The Start Script
COPY docker-start.sh ./docker-start.sh
RUN dos2unix ./docker-start.sh
RUN chmod +x ./docker-start.sh

CMD ["/bin/bash", "/minecraft-init/docker-start.sh"]