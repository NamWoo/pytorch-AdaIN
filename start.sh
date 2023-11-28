#!/bin/bash

xhost +

docker run --gpus all --privileged --rm -it -v /dev/video0:/dev/video0 -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -v /dev/snd:/dev/snd -e="QT_X11_NO_MITSHM=1" -v $(pwd):/root/pytorch-AdaIN pytorch/pytorch:1.13.1-cuda11.6-cudnn8-runtime bash