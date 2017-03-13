FROM oberthur/docker-ubuntu:16.04
MAINTAINER Lukasz Bielinski <l.bielinski@oberthur.com>

ENV ETCD_VER=v2.3.7
ENV DOWNLOAD_URL=https://github.com/coreos/etcd/releases/download

# Prepare image
RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install curl bash tar \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}


RUN curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
RUN mkdir -p /opt/etcd && tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /opt/etcd --strip-components=1
RUN chmod +x /opt/etcd/etcd
ENV PATH "$PATH:/opt/etcd"

CMD ["/opt/etcd/etcd"]
