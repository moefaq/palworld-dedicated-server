#!/bin/sh

#Update or Install PalServer
if [ ! -e "/home/steam/Steam/steamapps/common/PalServer/PalServer.sh" ]
then
    steamcmd +login anonymous +app_update 2394010 validate +quit
else
    steamcmd +login anonymous +app_update 2394010 +quit
fi
echo Running Options: ${OPTIONS}
exec "$@" "${OPTIONS}"
