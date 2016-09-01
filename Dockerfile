FROM debian:jessie
MAINTAINER Donald Hunter <donaldh@cisco.com>

RUN apt-get update && apt-get install -y \
	pmacct

COPY docker-entrypoint.sh /

ENV KAFKA_BROKER_HOST=127.0.0.1
ENV KAFKA_BROKER_PORT=9092
ENV KAFKA_TOPIC=pmacct

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 2100
CMD ["-P", "print"]
