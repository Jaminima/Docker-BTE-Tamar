# BTE Tamar (Paper) MC Docker Container

Deploy configurable Minecraft Paper servers easily and realiably with this handy container. This server comes with several preconfigured plugins, learn below how to add your own!

## Quick Start

To download and run the pre-build server, first make sure you have installed [Docker](https://docs.docker.com/engine/install/) on your server machine. Next do the following:

1. Create a folder for your server.

2. Make a copy of the `docker-compose.yml` and place it in the servers folder.

3. Open a terminal in the server folder, run `docker compose up -d`

This will start the minecraft server on the machine, you should then be able to join the server once it warms up using its ip address.

To allow remote connection, ensure you [Port Forward](https://www.wikihow.com/Set-Up-Port-Forwarding-on-a-Router) your router.

## MODs

Mods should be placed in `/mods`. These will be automatically loaded.