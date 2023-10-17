# jetson_docker

Build the docker image for jetson nano/tx2 with the ability to build opencv(4.8.0) with cuda/cudnn.
```bash
docker build --tag jetson .
docker run -it jetson
./build_opencv.sh
```
