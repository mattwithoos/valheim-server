FROM steamcmd/steamcmd

ENV DASHBOARD_PASSWORD=secret
ENV VALHEIM_SERVER_PATH=./valheim-server
ENV VALHEIM_PATH=${HOME}/valheim
ENV VALHEIM_SAVE_PATH=${VALHEIM_PATH}/save
ENV STEAMCMD_PATH=${HOME}/.steam/steamcmd/steamcmd.sh

VOLUME ${VALHEIM_PATH}

EXPOSE 8000/tcp
EXPOSE 2456/udp
EXPOSE 2457/udp
EXPOSE 2458/udp

COPY ./build ${VALHEIM_SERVER_PATH}
COPY ./copy/.toprc ${HOME}

ENTRYPOINT ["sh", "-c", "./valheim-server"]
