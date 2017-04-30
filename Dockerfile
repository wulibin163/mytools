FROM ubuntu:14.04

RUN sed -i 's#us.archive.ubuntu.com#mirrors.163.com#g' /etc/apt/sources.list
RUN sed -i 's#archive.ubuntu.com#mirrors.163.com#g' /etc/apt/sources.list

RUN apt-get update

RUN apt-get install -y curl lrzsz tcpdump subversion \
	 language-pack-zh-hant language-pack-zh-hans  language-pack-zh-hant-base language-pack-zh-hans-base
RUN echo "zh_CN.GBK GBK" >> /var/lib/locales/supported.d/local
RUN echo "zh_CN.GB2312 GB2312" >> /var/lib/locales/supported.d/local
RUN dpkg-reconfigure --force locales

RUN echo "export LANG=zh_CN.gbk" >> /root/.bashrc

RUN apt-get install -y aria2
#RUN cd /usr/local/bin/ && curl -sSL https://github.com/aria2/aria2/releases/download/release-1.31.0/aria2-1.31.0.tar.bz2 -o aria.tar.bz2

WORKDIR  /home/wlb/
