#!/bin/sh

cd /minecraft-init

# Copy server folders to the server directory
cp -r -f ./.fabric /minecraft
cp -r -f ./libraries /minecraft
cp -r -f ./config /minecraft
cp -r -f ./mods /minecraft
cp -r -f ./versions /minecraft

# Copy the server files
cp ./eula.txt /minecraft
cp ./server.properties /minecraft

# Start the server
cd /minecraft
java -jar -Xmx10G -Xms10G -Dfml.queryResult=confirm -jar forge-1.12.2-14.23.5.2859.jar nogui
