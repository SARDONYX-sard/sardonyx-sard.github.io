---
title: "Dockerを使ったfeapプログラムの実行"
date: "2021-04-21"
lastmod: "2021-12-15"
tags:
  - feap
  - Docker
categories:
  - programming
  - Docker
---

## 前書き

feap(A Finite Element Analysis Program)

日本語だと有限要素解析プログラム。

そのプログラムの学習用コードの実行がうまくできないと知人から相談されたため、Dockerで環境を作ってみた。

作成したコードは[こちら](https://github.com/SARDONYX-sard/docker--for-feap)

feapの公式サイトは[こちら](http://projects.ce.berkeley.edu/feap/feappv/)

## 苦悩

最初にGitHubでDocker feapとダメ元で検索し、見事に1つだけヒット。

Dockerfileを見つけたのはいいものの、ファイル内で指定されているリンクが切れていたためそのままビルドは不可。

Dockerfileを修正することになった。

### **Dockerfile:**

```diff
FROM ubuntu

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    gfortran \
    unzip \
    wget \
    xserver-xorg-dev \
 && rm -rf /var/lib/apt/lists/*

-ENV FEAPPVHOME3_1 /feappv/ver31
+ENV FEAPPVHOME5_1 /feappv/feappv-5.1.1c
WORKDIR /feappv
-ADD http://www.ce.berkeley.edu/projects/feap/feappv/feappv31.zip .
+ADD https://github.com/sanjayg0/feappv/archive/v5.1.1c.zip .
COPY makefile.in .

-RUN unzip feappv31.zip \
+RUN unzip v5.1.1c.zip \
 && mkdir -p decks \
-&& cp makefile.in ver31/ \
-&& cd ver31 \
+&& cp makefile.in feappv-5.1.1c/ \
+&& cd feappv-5.1.1c \
 && make install

+RUN echo "alias feap='/feappv/feappv-5.1.1c/main/feappv'" >> /root/.bashrc

WORKDIR /feappv/decks
CMD /feappv/ver31/main/feappv
```

## 第二の苦悩、Xサーバー

DockerコンテナーからホストOSへXサーバーを介してGUIを立ち上げるのに苦戦した。

サイトをあさっているうち、参考になりそうなサイトをみつけた。 ↓

[WSL2環境で動作するDockerを使用してX Window SystemのGoogle Chromeブラウザを動作させる](https://uepon.hatenadiary.com/entry/2020/12/30/005941)

案内に従い、windowsとDockerに入れたUbuntuの双方の中へXサーバーをインストール。

![feap](/images/feap/feap.webp)

## おわりに

ダメもとだったが何とか動いた。

ただgitをあまり知らない頃に作ったせいで、remote repositoryにpushしたとき、改行コードの問題で友人がgit
cloneする頃には文字化けでプログラムが動かないという不具合があった。`.editorconfig`を入れておくべき…
