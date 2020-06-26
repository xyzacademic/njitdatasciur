FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04
MAINTAINER Yunzhe Xue "yunzhexue@gmail.com"
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential cmake git curl ca-certificates libjpeg-dev \
    libpng-dev vim && \
    rm -rf /var/lib/apt/list/*

RUN curl -o ~/anaconda.sh -O https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh && \
chmod +x ~/anaconda.sh && \
bash ~/anaconda.sh -b -p /opt/conda && rm ~/anaconda.sh

ENV PATH /opt/conda/bin:$PATH && PYTHONPATH $PYTHONPATH:/research


RUN mkdir /research

