# Machine Translation

This repository contains our translation model (en-hu) which were published in [MSZNY 2022](https://rgai.inf.u-szeged.hu/mszny2022) conference.

Model and log files are available in: https://nc.nlp.nytud.hu/s/p23BsM5RrYMkM7S

We have trained our model with [Marian-dev](https://github.com/marian-nmt/marian-dev) v1.10.23; commit: `42f0b8b7` 2021-07-11 06:56:58 +0100.

To try it out a REST API demo is available. You can use the following format to call the translator

## Request
```
curl -H "Content-Type: application/json" -X POST -d '{"text":"I have a cat."}' https://juniper.nytud.hu/demo/nlp/trans
```

## Response
```
HTTP/2 200
server: nginx/1.18.0
date: Tue, 25 Jan 2022 11:46:55 GMT
content-type: text/html; charset=utf-8
content-length: 29
access-control-allow-origin: *

{"text": "Van egy macskám."}
```

# Install and use in your machine
## Build docker image
```bash
docker build -t translator_mariannmt .
```
## Run command line script
There is an example script to use marian-decoder over docker container. The `run_translator.sh` script downloads the model files and start a `marian-decoder`. With `CUDA_VISIBLE_DEVICES` environment variable you can start CPU (`CUDA_VISIBLE_DEVICES=""`) or GPU (`CUDA_VISIBLE_DEVICES=0`) translator. This example code reads STDIN, and writes to STDOUT.

# License and usage 🆕
The model is available under the license `CC-BY-NC 4.0`. If you use this model for research, please cite our paper (see below). For commercial use, please contact the Hungarian Research Centre for Linguistics (`varadi.tamas@nytud.hu`).

# Citation
If you use this resource or any part of its documentation, please refer to:

Laki, László János and Yang, Zijian Győző (2022) Jobban fordítunk magyarra, mint a Google! [We translate better into Hungarian, than Google!]. XVIII. Magyar Számítógépes Nyelvészeti Konferencia. (in press)

```
@inproceedings {laki-yang-mszny,
    title = {{Jobban fordítunk magyarra, mint a Google!}},
    booktitle = {XVIII. Magyar Számítógépes Nyelvészeti Konferencia},
    year = {2022},
    publisher = {Szegedi Tudományegyetem, Informatikai Intézet},
    address = {Szeged, Magyarország},
    author = {Laki, László and Yang, Zijian Győző},
    pages = {357--372}
}
```
