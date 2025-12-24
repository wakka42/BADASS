#!/bin/sh

/usr/lib/frr/frrinit.sh start > /var/log/frr-start.log
exec /bin/sh -i
