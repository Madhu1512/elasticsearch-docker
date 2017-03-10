FROM docker.elastic.co/elasticsearch/elasticsearch:5.2.2

WORKDIR /usr/share/elasticsearch

# Install EC2 Discovery plugin and S3 repository plugin
RUN eval ${ES_JAVA_OPTS:-} elasticsearch-plugin install --batch discovery-ec2
RUN eval ${ES_JAVA_OPTS:-} elasticsearch-plugin install --batch repository-s3

# Install Ingest Plugins (GeoIP and UserAgent)
RUN eval ${ES_JAVA_OPTS:-} elasticsearch-plugin install --batch ingest-geoip
RUN eval ${ES_JAVA_OPTS:-} elasticsearch-plugin install --batch ingest-user-agent

COPY es-docker bin/es-docker
