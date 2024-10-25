#!/bin/bash

if test -f "/home/sfserver/steamcmd_linux.tar.gz"; then
sh /home/sfserver/Satisfactory/FactoryServer.sh
else
wget -O /home/sfserver/steamcmd_linux.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && tar xf /home/sfserver/steamcmd_linux.tar.gz && /home/sfserver/steamcmd.sh +force_install_dir /home/sfserver/Satisfactory +login anonymous +app_update 1690800 -beta public validate +quit && \
mkdir -p /home/sfserver/.steam/sdk64 && \
cp /home/sfserver/linux64/steamclient.so /home/sfserver/.steam/sdk64/steamclient.so 
fi
