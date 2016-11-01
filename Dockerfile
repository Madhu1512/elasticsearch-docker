FROM docker.elastic.co/elasticsearch/elasticsearch:5.0.0

WORKDIR /usr/share/elasticsearch

# Install EC2 Discovery plugin
RUN eval ${ES_JAVA_OPTS:-} elasticsearch-plugin install --batch discovery-ec2

# Install Ingest Plugins ( GeoIP and UserAgent)
RUN eval ${ES_JAVA_OPTS:-} elasticsearch-plugin install --batch ingest-geoip
RUN eval ${ES_JAVA_OPTS:-} elasticsearch-plugin install --batch ingest-user-agent

COPY es-docker bin/es-docker

USER root
RUN chown elasticsearch:elasticsearch bin/es-docker && \
    chmod 0750 bin/es-docker

USER elasticsearch
CMD ["/bin/bash", "bin/es-docker"]

EXPOSE 9200 9300
