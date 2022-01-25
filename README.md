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
