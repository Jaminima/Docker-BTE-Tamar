#!/bin/sh

cd /minecraft-init

# Copy server folders to the server directory
cp -r -f ./libraries /minecraft
cp -r -f ./config /minecraft
cp -r -f ./mods /minecraft

# Copy the server files
cp ./eula.txt /minecraft
cp ./run.sh /minecraft
cp ./user_jvm_args.txt /minecraft
cp ./bcc-common.toml /minecraft/config
cp ./server.properties /minecraft

# Start the server
cd /minecraft
bash /minecraft/run.sh
