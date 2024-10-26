FROM akaronte/steamcmd:latest

STOPSIGNAL SIGTERM

ENV PUID=1000 PGID=1000 LANG=en_US.utf8 TERM=xterm VERSION=public

USER root

WORKDIR /home/sfserver

COPY entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

RUN chown sfserver:sfserver /entrypoint.sh

RUN chown -R sfserver:sfserver /home/sfserver

USER sfserver

EXPOSE 15777/udp 15000/udp 7777/udp

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
