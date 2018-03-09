FROM krallin/ubuntu-tini:xenial

ENV TERM=ansi DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
ENV PATH /bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin

RUN mkdir -p /etc/hashicorp/consul/server /etc/hashicorp/consul/client /etc/hashicorp/vault /var/hashicorp/consul
COPY ./bin/* /usr/local/bin/

# ENTRYPOINT ["/usr/local/bin/tini", "--", "/usr/local/bin/vault", "server", "-config", "/etc/hashicorp/vault/config.hcl"]

COPY Dockerfile /Dockerfile
