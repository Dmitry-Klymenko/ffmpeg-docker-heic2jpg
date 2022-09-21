FROM jrottenberg/ffmpeg:alpine

MAINTAINER Dmitry Klymenko
RUN apk --update add exiftool && rm -rf /var/cache/apk/*
COPY entrypoint.sh entrypoint.sh

VOLUME /input
VOLUME /output

ENTRYPOINT ["./entrypoint.sh"]

