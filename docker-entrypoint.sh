#!/bin/bash

set -e

echo >/etc/pmacct/nfacctd.conf <<EOF
! nfacctd configuration
!
daemonize: true
pidfile: /var/run/nfacctd.pid
syslog: daemon
!
plugins: kafka
!
aggregate: src_host, dst_host, src_port, dst_port, proto, tos
kafka_broker_host: $(KAFKA_BROKER_HOST)
kafka_broker_port: $(KAFKA_BROKER_PORT)
kafka_topic: $(KAFKA_TOPIC)
kafka_refresh_time: 300
kafka_history: 5m
kafka_history_roundoff: m
!
EOF

exec nfacctd "$@"
