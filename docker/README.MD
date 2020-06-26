Docker
---------------

Recommend python environment


Quick Start
-

### 1. Install

- [Windows 10 pro](https://docs.docker.com/docker-for-windows/install/)
- [Linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- [MAC](https://docs.docker.com/docker-for-mac/install/)
    

### 2. Pull image
In the first time, you should pull a pre-made docker image. If you will run your
program on Nvidia GPU, please intsll
 [nvidia-docker2](https://github.com/NVIDIA/nvidia-docker) firstly.

After that, you can start to pull a general docker image. `nvidia/cuda` is the
repository name, `cuda:10.1-cudnn7-devel-ubuntu16.04` is the tag.

    docker pull nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04


Then you can start a container based on the above image. Container is a instance 
of the image. Everything run on the container.

For convenience, you can start from `pytorch/pytorch` docker.

Then you can check your all images by command:

    docker images
    
You can start a new container under interactive mode and run /bin/bash 
by this command. You may also replace the image name by its image id.

    docker run -it nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04 /bin/bash
    
Please use `apt-get` to download some common used tools

```angular2html
apt-get update
apt-get install -y --no-install-recommends \
build-essential cmake git curl ca-certificates libjpeg-dev libpng-dev vim 
rm -rf /var/lib/apt/list/*
```

Then you can download and install miniconda or anaconda.

```angular2html
curl -o ~/anaconda.sh -O https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh && \
chmod +x ~/anaconda.sh 
bash ~/anaconda.sh -b -p /opt/conda && rm ~/anaconda.sh
```

Type `exit` to quit the container.

Check all container and their status.
    
    docker ps -a

Stop container.

    docker stop $container_id
    docker stop $(docker ps -aq)  # stop all container
    
Delete container

    docker rm $container_id
    docker rm $(docker ps -aq)  # stop all container
    
After quit a container, this container will stop automatically, if you want to 
run it again.

    docker start $container_id
    docker exec -it $container_id /bin/bash
    
You can also build a image from `Dockerfile`.
Just copy the Dockerfile in your directory. And type

    docker build -t base .
    
This command will use the Dockerfile in your current directory to build a image. 
`base` is the image's name. This `Dockerfile' includes all command I post above.
In this version, I have add `/opt/conda/bin` into `$PATH'. So you can run this 
command to run python

    docker exec $container_id python
    docker exec -it $container_id python

Then you can start to install your favorite python package through `conda install`.
```angular2html
conda install python=3.6
conda install pytorch torchvision cudatoolkit=10.1 -c pytorch

```

After you quit the container, the changes will stay in the container but the image.
So you can build a new image based on the modified container to store your changes.
It is based on `commit` operation like `git`.

    docker commit -m="pytorch install" $container_id $new_image_name