FROM alpine:latest

LABEL maintainer="https://github.com/Auhrus"
LABEL org.opencontainers.image.source="https://github.com/Auhrus/fivem-docker-server"

ENV gtaversion="legacy"
ENV legacydownload="recommended"

EXPOSE 30120/tcp
EXPOSE 30120/udp
EXPOSE 40120/tcp

RUN apk add --no-cache curl libgcc libstdc++ tzdata

RUN addgroup -g 1001 -S fivem && \
    adduser  -u 1001 -S -G fivem -H -s /sbin/nologin fivem

RUN chown 1001:1001 /opt

COPY ./startup.sh /opt/startup.sh

WORKDIR /opt
USER fivem

ENTRYPOINT ["sh", "/opt/startup.sh"]