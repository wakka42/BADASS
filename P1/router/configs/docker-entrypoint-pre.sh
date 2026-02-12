#! /bin/bash

# pre entrypoint instructions
gomplate < /tmp/router.conf > /etc/frr/frr.conf

exec /sbin/tini -- $@