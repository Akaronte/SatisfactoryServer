FROM centos:centos7.5.1804

STOPSIGNAL SIGTERM

ENV PUID=1000 PGID=1000 LANG=en_US.utf8 TERM=xterm VERSION=public

USER root

RUN yum install -y epel-release sudo

RUN yum update -y

RUN yum install -y nano wget screen glibc.i686 libstdc++.i686 ncurses-libs.i686

RUN yum install -y bzip2 curl lsof libstdc++.i686 glibc.i686 libstdc++.i686 perl-Compress-Zlib -y

RUN yum install -y curl wget tar bzip2 gzip unzip python3 binutils bc jq tmux glibc.i686 libstdc++ libstdc++.i686 zlib-devel nmap-ncat file

RUN adduser -m sfserver -u 1000

WORKDIR /home/sfserver

USER sfserver

RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && tar xf steamcmd_linux.tar.gz 

RUN ./steamcmd.sh +force_install_dir ./Satisfactory +login anonymous +app_update 1690800 -beta public validate +quit

USER root

RUN mkdir -p /home/sfserver/.steam/sdk64 && cp /home/sfserver/linux64/steamclient.so /home/sfserver/.steam/sdk64/steamclient.so

RUN chown -R sfserver:sfserver /home/sfserver

USER sfserver

EXPOSE 15777/udp 15000/udp 7777/udp

VOLUME /home/sfserver/Satisfactory/FactoryGame/Saved/Logs /home/sfserver/.config/Epic/FactoryGame/Saved/SaveGames

CMD ["/home/sfserver/Satisfactory/FactoryServer.sh"]