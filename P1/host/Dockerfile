FROM alpine:latest

RUN apk update && apk add --no-cache \
    busybox \
    iproute2 \
    iputils \
    tcpdump \
    bash

CMD ["/bin/sh"]