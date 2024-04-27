# ffmpeg-docker-heic2jpg
A docker container to batch convert heic to jpg

Latest image is at [https://hub.docker.com/repository/docker/dmitryklymenko/ffmpeg-docker-heic2jpg] https://hub.docker.com/repository/docker/dmitryklymenko/ffmpeg-docker-heic2jpg

To push into dockerhub use;

```
docker build -t IMAGENAME .
docker push IMAGENAME
```
where image name could be: dmitryklymenko/ffmpeg-docker-heic2jpg

Container expects two volumes: /input and /output and will scan /input for HEIC files recursively and will convert them into the same directory structure in the /output volume.
You can run container like this
```
/usr/local/bin/docker run --rm -c 0 --name=ffmpeg-docker-heic2jpg-instance1 -v '/volume1/heic-photos':/input -v /volume2/tmp/converted-to-jpg:/output dmitryklymenko/ffmpeg-docker-heic2jpg -n > /volume2/path-to-log-file.log
```
