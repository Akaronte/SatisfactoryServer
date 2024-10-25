FROM ubuntu:20.04

STOPSIGNAL SIGTERM

ENV PUID=1000 PGID=1000 LANG=en_US.utf8 TERM=xterm VERSION=public

USER root

RUN apt-get update && apt-get install -y sudo

RUN apt-get update && apt-get upgrade -y

# RUN apt-get install -y nano wget screen libc6:i386 libstdc++6:i386 libncurses5:i386

# RUN apt-get install -y bzip2 curl lsof libstdc++6:i386 libc6:i386 perl

RUN apt-get install -y curl wget tar bzip2 gzip unzip python3 binutils bc jq tmux nmap file

RUN adduser --disabled-password --gecos "" sfserver --uid 1000

WORKDIR /home/sfserver

COPY entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

RUN chown sfserver:sfserver /entrypoint.sh

RUN chown -R sfserver:sfserver /home/sfserver

USER sfserver

EXPOSE 15777/udp 15000/udp 7777/udp

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]