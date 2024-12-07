#!/bin/sh

# cd /minecraft-init

# # Copy server folders to the server directory
# cp -r -f ./libraries /minecraft
# cp -r -f ./mods /minecraft

# # Copy the server files
# cp ./eula.txt /minecraft
# cp ./server.properties /minecraft
# cp ./*.jar /minecraft

# Start the server
cd /minecraft
java -jar -Xmx5G -Xms5G -Dfml.queryResult=confirm -jar forge-1.12.2-14.23.5.2859.jar nogui
