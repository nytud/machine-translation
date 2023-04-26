#!/bin/bash

set -x

base_dir=$(dirname $(readlink -f $0))

bash $base_dir/install.sh

cpu_command=""
gpu_command="--runtime nvidia -e NVIDIA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES}"
if [[ ${CUDA_VISIBLE_DEVICES} == "" ]]; then
  cpu_command="--cpu-threads 1"
  gpu_command=""
fi

docker build -t translator_mariannmt $base_dir

docker run -it --rm $gpu_command -v $base_dir/models:/models translator_mariannmt /marian/build/marian-decoder -m /models/model.npz --vocabs /models/vocab.spm /models/vocab.spm --devices 0 $cpu_command