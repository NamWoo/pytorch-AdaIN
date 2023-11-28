FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-runtime
##FROM pytorch/pytorch:1.7.0-cuda11.0-cudnn8-runtime

LABEL maintainer="pre3ice@gmail.com"

RUN apt-get -y update
#COPY docker/requirements.txt /src/requirements.txt

RUN pip install -r /src/requirements.txt

# COPY *.py /src/
# RUN echo "#! $(which python)" | cat - /src/train.py > /src/train.tmp.py
# RUN mv /src/train.tmp.py /src/train.py
# RUN chmod +x /src/train.py
# RUN ln -s /src/train.py /usr/local/bin/adain-train
# RUN echo "#! $(which python)" | cat - /src/test.py > /src/test.tmp.py
# RUN mv /src/test.tmp.py /src/test.py
# RUN chmod +x /src/test.py
# RUN ln -s /src/test.py /usr/local/bin/adain-test

# COPY docker/bash.bashrc /etc/bash.bashrc
# RUN chmod 777 -R /workspace
# ENV XDG_CACHE_HOME=/workspace/.cache

WORKDIR /root
RUN git clone https://github.com/NamWoo/pytorch-AdaIN.git
ENV PYTHONPATH "${PYTONPATH}:/root/pytorch-AdaIN"
WORKDIR /root/pytorch-AdaIN/models
RUN pip install -r requirements.txt
RUN apt-get install -y libgl1-mesa-glx libglib2.0-0 libgtk2.0-dev

RUN apt-get install -y wget
RUN wget -no-check-certificate 'https://docs.google.com/uc?export=download&id=1bMfhMMwPeXnYSQI6cDWElSZxOxc6aVyr' -O decoder.pth
RUN wget -no-check-certificate 'https://docs.google.com/uc?export=download&id=1EpkBA2K2eYILDSyPTt0fztz59UjAIpZU' -O vgg_normalised.pth

WORKDIR /root/pytorch-AdaIN
# RUN pip install imageio-ffmpeg


CMD [ "bash" ]