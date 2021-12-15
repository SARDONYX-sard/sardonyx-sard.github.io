---
title: "Running a feap program using Docker"
date: "2021-04-21"
lastmod: "2021-12-15"
tags:
  - feap
  - Docker
categories:
  - programming
  - Docker
---

## Preface

feap(A Finite Element Analysis Program)

This is a finite element analysis program in Japanese.

I was asked by an acquaintance if I could execute the learning code of this program, so I created an environment using Docker.

The code I created is [here](https://github.com/SARDONYX-sard/docker--for-feap)

The official website of feap is [here](http://projects.ce.berkeley.edu/feap/feappv/)

## Suffering

First, I searched on GitHub for Docker feap and no luck, and got only one hit.

I found the Dockerfile, but the link specified in the file was broken, so I couldn't build it.

I had to modify the Dockerfile.

### **Dockerfile:**

```diff
FROM ubuntu

RUN apt-get update && apt-get install -y \
    build-essential \fnDroid
    gcc \
    gfortran\
    unzip
    wget\
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

## The Second Agony, X Server

I struggled to get the GUI up from the Docker container to the host OS via the X server.

While scouring sites, I found a site that might be helpful. ↓↓

[Running Google Chrome browser on X Window System using Docker running in WSL2 environment](https://uepon.hatenadiary.com/entry/2020/12/30/005941)

I followed the directions and installed the X server in both windows and Ubuntu in Docker.

! [feap](/images/feap/feap.webp)

## Conclusion

It was a long shot, but it worked somehow.

However, because I made it when I didn't know much about git, when I pushed it to the remote repository, it was garbled by the time my friend cloned git
By the time my friend cloned it, the program didn't work because of garbled characters. I should have included `.editorconfig`...
