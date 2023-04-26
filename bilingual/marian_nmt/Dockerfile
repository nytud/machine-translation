FROM nvidia/cuda:11.4.1-devel-ubuntu20.04

ARG http_proxy=""
ENV https_proxy=$http_proxy
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/Europe/Budapest /etc/localtime

WORKDIR /tmp
# NVIDIA apt update key fail 22.04.28
RUN rm -rf /etc/apt/sources.list.d/cuda.list
RUN rm -rf /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-key del 7fa2af80
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/7fa2af80.pub

RUN apt-get clean && apt-get update
RUN apt-get install -y git wget locales
RUN mv /bin/sh /bin/sh.orig && ln -s /bin/bash /bin/sh

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt-get install -y git build-essential gcc nano libboost-system-dev libprotobuf17 protobuf-compiler libprotobuf-dev openssl libssl-dev libgoogle-perftools-dev python3 python3-pip

RUN wget -qO- 'https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB' | apt-key add -
RUN sh -c 'echo deb https://apt.repos.intel.com/mkl all main > /etc/apt/sources.list.d/intel-mkl.list'
RUN apt-get update
RUN apt-get install -y intel-mkl-64bit-2020.0-088
RUN apt-get install -y cmake

# Setting up Marian-nmt
ARG MARIAN_COMMIT=42f0b8b7
LABEL marian_commit=$MARIAN_COMMIT
ENV MARIAN_COMMIT=${MARIAN_COMMIT}
RUN git clone --recursive https://github.com/marian-nmt/marian-dev /marian
RUN cd /marian && git checkout ${MARIAN_COMMIT}
WORKDIR /marian/build
RUN cmake .. -DUSE_SENTENCEPIECE=on -DUSE_CPU=on
# -jx -> multithreaded build
ARG marian_nproc=""
RUN make -j ${marian_nproc}
RUN find /marian/build -name "CMakeFiles" | xargs rm -rf

RUN apt remove -y git cmake intel-mkl-64bit-2020.0-088

VOLUME /models
