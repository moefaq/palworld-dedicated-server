FROM moefaq/steamcmd_dockerized:Binary AS builder

ENV APPNAME "PalServer"
ENV STEAMDIR ${USERDIR}/Steam
ENV APPDIR ${STEAMDIR}/steamapps/common/${APPNAME}
ENV WORKSHOPDIR ${STEAMDIR}/steamapps/workshop

USER ${USER}
ADD --chown=steam:steam --chmod=755 docker-entrypoint.sh /
RUN mkdir -p ${WORKSHOPDIR}/workshop && \
    mkdir -p ${APPDIR} && \
    mkdir -p ${APPDIR}/Pal/Saved/SaveGames && \
    mkdir -p ${APPDIR}/Pal/Saved/Config/LinuxServer/
WORKDIR ${APPDIR}

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD ["./PalServer.sh"]