FROM krallin/ubuntu-tini:xenial

ENV TERM=ansi DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
ENV PATH /bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin

RUN apt-get update && \
    apt-get install -y dnsutils && \
    apt-get clean all

RUN mkdir -p /etc/hashicorp/consul/server /etc/hashicorp/consul/client /etc/hashicorp/vault /var/hashicorp/consul
COPY ./bin/* /usr/local/bin/

COPY Dockerfile /Dockerfile
