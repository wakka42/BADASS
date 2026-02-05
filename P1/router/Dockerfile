FROM quay.io/frrouting/frr:master

RUN apk add iproute2

COPY    ./configs/.profile \
        ./configs/.ashrc \
        /root/
ENV ENV="/root/.ashrc"

COPY    ./configs/daemons \
        ./configs/vtysh.conf \
        /etc/frr/