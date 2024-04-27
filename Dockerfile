FROM jrottenberg/ffmpeg:alpine

LABEL maintainer="Dmitry Klymenko"

COPY entrypoint.sh entrypoint.sh
RUN apk --update add exiftool && \
    rm -rf /var/cache/apk/* && \
    chmod +x entrypoint.sh

VOLUME /input
VOLUME /output

ENTRYPOINT ["./entrypoint.sh"]
