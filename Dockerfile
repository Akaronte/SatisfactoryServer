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

COPY entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

RUN chown sfserver:sfserver /entrypoint.sh

RUN chown -R sfserver:sfserver /home/sfserver

USER sfserver

EXPOSE 15777/udp 15000/udp 7777/udp

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
