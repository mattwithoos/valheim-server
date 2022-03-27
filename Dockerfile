FROM steamcmd/steamcmd

ENV DASHBOARD_PASSWORD=secret
ENV VALHEIM_SERVER_PATH=${HOME}/valheim-server
ENV VALHEIM_PATH=${HOME}/valheim
ENV VALHEIM_SAVE_PATH=${VALHEIM_PATH}/save
ENV STEAMCMD_PATH=${HOME}/.steam/steamcmd/steamcmd.sh

ENV DOORSTOP_ENABLE=TRUE
ENV DOORSTOP_INVOKE_DLL_PATH=${VALHEIM_PATH}/BepInEx/core/BepInEx.Preloader.dll
ENV DOORSTOP_CORLIB_OVERRIDE_PATH=${VALHEIM_PATH}/unstripped_corlib
ENV LD_LIBRARY_PATH="${VALHEIM_PATH}/doorstop_libs:$LD_LIBRARY_PATH"
ENV LD_PRELOAD="libdoorstop_x64.so:$LD_PRELOAD"
ENV LD_LIBRARY_PATH="${VALHEIM_PATH}/linux64:$LD_LIBRARY_PATH"
ENV SteamAppId=892970


VOLUME ${VALHEIM_PATH}

EXPOSE 8000/tcp
EXPOSE 2456/udp
EXPOSE 2457/udp
EXPOSE 2458/udp

COPY ./build ${VALHEIM_SERVER_PATH}
COPY ./copy/.toprc ${HOME}

#RUN chmod +x ${VALHEIM_PATH}/set_env.sh
ENTRYPOINT ["sh", "-c", "${VALHEIM_SERVER_PATH}/valheim-server"]
