#!/bin/bash

base_dir=$(dirname $(readlink -f $0))
if [[ ! -d $base_dir/models ]]; then
  mkdir $base_dir/models
fi

if [[ ! -f $base_dir/models/model.npz ]]; then
  wget https://nc.nlp.nytud.hu/s/gGtr4Go98Kdeega/download -O $base_dir/models/model.npz
fi
if [[ ! -f $base_dir/models/vocab.spm ]]; then
  wget https://nc.nlp.nytud.hu/s/knL7GAeTTsRoxH8/download -O $base_dir/models/vocab.spm
fi

exit 0