FROM steamcmd/steamcmd

ENV DASHBOARD_PASSWORD=secret
ENV VALHEIM_SERVER_PATH=${HOME}/valheim-server
ENV VALHEIM_PATH=${HOME}/valheim
ENV VALHEIM_SAVE_PATH=${VALHEIM_PATH}/save
ENV STEAMCMD_PATH=${HOME}/.steam/steamcmd/steamcmd.sh

ENV DOORSTOP_ENABLE=TRUE
ENV DOORSTOP_INVOKE_DLL_PATH=./BepInEx/core/BepInEx.Preloader.dll
ENV DOORSTOP_CORLIB_OVERRIDE_PATH=./unstripped_corlib
ENV LD_LIBRARY_PATH="./doorstop_libs:$LD_LIBRARY_PATH"
ENV LD_LIBRARY_PATH="./linux64:$LD_LIBRARY_PATH"
ENV SteamAppId=892970

VOLUME ${VALHEIM_PATH}

EXPOSE 8000/tcp
EXPOSE 2456/udp
EXPOSE 2457/udp
EXPOSE 2458/udp

RUN mkdir -p /root/.steam/sdk64
COPY ./build ${VALHEIM_SERVER_PATH}
COPY ./copy/.toprc ${HOME}
COPY ./start_modded.sh ${VALHEIM_PATH}/start_modded.sh

RUN chmod +x ${VALHEIM_PATH}/start_modded.sh
RUN chmod +x ${VALHEIM_PATH}/valheim_server.x86_64
ENTRYPOINT ["sh", "-c", "${VALHEIM_SERVER_PATH}/valheim-server"]
