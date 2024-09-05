FROM debian:bookworm-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN set -eux && \
    apt-get update -qq && \
    apt-get -qq install \
        iproute2 \
        krb5-config \
        openssl \
        samba \
        smbclient \
        tini \
        vim \
        winbind \
    && \
    rm /etc/krb5.conf
 
WORKDIR /opt/ad-scripts

COPY samba-ad-setup.sh ./
COPY samba-ad-run.sh ./
COPY entrypoint.sh ./

ENTRYPOINT ["/usr/bin/tini", "--", "./entrypoint.sh"]
