FROM quay.io/pires/docker-elasticsearch:6.0.0_jre8u151

MAINTAINER pjpires@gmail.com

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery

# Kubernetes requires swap is turned off, so memory lock is redundant
ENV MEMORY_LOCK false

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
