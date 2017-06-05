FROM ubuntu:16.04
RUN apt-get update

RUN apt-get install -y libncurses5 libncurses5-dev m4 bison flex libstdc++6 g++ libtool sqlite
RUN apt-get install -y gcc g++ binutils patch bzip2 flex bison make gettext unzip zlib1g-dev

RUN apt-get install -y libc6 libncurses5-dev  automake automake automake
RUN apt-get install -y git-core

RUN apt-get install -y libc6-i386 lib32z-dev

ENV HOME=/root/


RUN mkdir /root/tomato_git
WORKDIR /root/tomato_git

RUN git clone git://repo.or.cz/tomato.git

WORKDIR /root/tomato_git/tomato

RUN git checkout tomato-shibby-RT-AC

RUN ln -s /root/tomato_git/tomato/ ~/tomato

RUN ln -s ~/tomato/tools/brcm /opt/brcm
ENV PATH=$PATH:/opt/brcm/hndtools-mipsel-linux/bin:/opt/brcm/hndtools-mipsel-uclibc/bin

WORKDIR /root/tomato_git/tomato/release/src-rt
RUN apt-get install -y net-tools

RUN make r64e

