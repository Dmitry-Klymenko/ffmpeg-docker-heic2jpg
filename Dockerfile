FROM jrottenberg/ffmpeg:alpine

LABEL maintainer="Dmitry Klymenko"
LABEL version="0.2"
LABEL description="Docker image for converting HEIC/HEIF images to JPG format using ffmpeg and exiftool."
LABEL url="https://github.com/Dmitry-Klymenko/ffmpeg-docker-heic2jpg"
LABEL documentation="https://github.com/Dmitry-Klymenko/ffmpeg-docker-heic2jpg/README.md"
LABEL build-date="2024-04-27"
LABEL org.opencontainers.image.title="Batch HEIC to JPG Converter"
LABEL org.opencontainers.image.description="Batch converts HEIC/HEIF images to JPG format using ffmpeg and exiftool"
LABEL org.opencontainers.image.authors="Dmitry Klymenko"


COPY entrypoint.sh /entrypoint.sh
RUN apk --update add exiftool && \
    rm -rf /var/cache/apk/* && \
    chmod +x /entrypoint.sh


VOLUME /input
VOLUME /output

ENTRYPOINT ["/entrypoint.sh"]
