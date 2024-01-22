FROM moefaq/steamcmd_dockerized:Repo AS builder

ADD --chown=steam:steam --chmod=755 docker-entrypoint.sh /
RUN mkdir -p ${USERDIR}/Steam/steamapps/workshop && \
    mkdir -p ${USERDIR}/Steam/steamapps/common/PalServer/Pal/Saved/SaveGames
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD ["./PalServer.sh"]