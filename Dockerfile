FROM nvcr.io/nvidia/l4t-base:r32.7.1

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -y && \
        apt-get install -y --no-install-recommends ca-certificates make g++ vim git mc cmake sudo

COPY nvidia-l4t-apt-source.list /etc/apt/sources.list.d/

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gnupg

COPY ./nano_build_opencv /build_opencv

COPY trusted-key /build_opencv/

RUN apt-key add /build_opencv/trusted-key
#RUN DEBIAN_FRONTEND=noninteractive apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0D296FFB880FB004

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential \
                gfortran \
                nvidia-cudnn8 \
                libcublas-dev \
                libatlas-base-dev \
                libavcodec-dev \
                libavformat-dev \
                libavresample-dev \
                libcanberra-gtk3-module \
                libdc1394-22-dev \
                libeigen3-dev \
                libglew-dev \
                libgstreamer-plugins-base1.0-dev \
                libgstreamer-plugins-good1.0-dev \
                libgstreamer1.0-dev \
                libgtk-3-dev \
                libjpeg-dev \
                libjpeg8-dev \
                libjpeg-turbo8-dev \
                liblapack-dev \
                liblapacke-dev \
                libopenblas-dev \
                libpng-dev \
                libpostproc-dev \
                libswscale-dev \
                libtbb-dev \
                libtbb2 \
                libtesseract-dev \
                libtiff-dev \
                libv4l-dev \
                libxine2-dev \
                libxvidcore-dev \
                libx264-dev \
                pkg-config \
                python-dev \
                python-numpy \
                python3-dev \
                python3-numpy \
                python3-matplotlib \
                qv4l2 \
                v4l-utils \
                zlib1g-dev
#COPY ./samples /tmp/samples
COPY ./nano_build_opencv /build_opencv

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mlocate libcufft-dev-10-2 libnpp-dev-10-2

RUN updatedb

WORKDIR /build_opencv
# RUN make clean && make

# CMD ["./deviceQuery"]