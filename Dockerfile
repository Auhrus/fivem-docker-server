FROM alpine:latest

MAINTAINER "https://github.com/Auhrus"

LABEL org.opencontainers.image.source https://github.com/Auhrus/fivem-docker-server

ENV download="recommended"

EXPOSE 40120
EXPOSE 30120
EXPOSE 30110

COPY ./startup.sh /opt/fivem/startup.sh

RUN apk add --no-cache libgcc libstdc++ ca-certificates npm
RUN npm install -g fvm-installer

WORKDIR /opt/fivem

ENTRYPOINT ["sh", "/opt/fivem/startup.sh"]
