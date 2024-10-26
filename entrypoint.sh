#!/bin/bash

if test -f "/home/sfserver/Satisfactory/FactoryServer.sh"; then
sh /home/sfserver/Satisfactory/FactoryServer.sh
else
cd ~ && curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -&& \
./steamcmd.sh +force_install_dir /home/sfserver/Satisfactory +login anonymous +app_update 1690800 -beta public validate +quit && \
mkdir -p /home/sfserver/.steam/sdk64 && \
cp /home/sfserver/linux64/steamclient.so /home/sfserver/.steam/sdk64/steamclient.so 
fi
