FROM docker.elastic.co/elasticsearch/elasticsearch:5.1.1

WORKDIR /usr/share/elasticsearch

# Install EC2 Discovery plugin
RUN eval ${ES_JAVA_OPTS:-} elasticsearch-plugin install --batch discovery-ec2

# Install Ingest Plugins (GeoIP and UserAgent)
RUN eval ${ES_JAVA_OPTS:-} elasticsearch-plugin install --batch ingest-geoip
RUN eval ${ES_JAVA_OPTS:-} elasticsearch-plugin install --batch ingest-user-agent

COPY es-docker bin/es-docker
