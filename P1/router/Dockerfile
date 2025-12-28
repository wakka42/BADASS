FROM alpine:latest

RUN apk update && apk add --no-cache \
    frr \
    busybox \
    iproute2 \
    iputils \
    tcpdump \
    bash \
    vim

RUN sed -i 's/bgpd=no/bgpd=yes/' /etc/frr/daemons && \
    sed -i 's/ospfd=no/ospfd=yes/' /etc/frr/daemons && \
    sed -i 's/isisd=no/isisd=yes/' /etc/frr/daemons && \
    sed -i 's/zebra=no/zebra=yes/' /etc/frr/daemons

RUN mkdir -p /var/run/frr && \
    chown -R frr:frr /etc/frr /var/run/frr

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]