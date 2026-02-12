FROM quay.io/frrouting/frr:10.5.1

RUN apk add iproute2

COPY    ./configs/.profile \
        ./configs/.ashrc \
        /root/
ENV ENV="/root/.ashrc"

COPY    ./configs/daemons \
        ./configs/vtysh.conf \
        /etc/frr/

COPY --from=hairyhenderson/gomplate:stable /gomplate /bin/gomplate
COPY ./configs/router.conf /tmp

COPY    ./configs/docker-entrypoint-pre.sh /run
ENTRYPOINT ["/run/docker-entrypoint-pre.sh"]
CMD ["/usr/lib/frr/docker-start"]