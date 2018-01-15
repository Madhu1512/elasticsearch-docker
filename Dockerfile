FROM docker.elastic.co/elasticsearch/elasticsearch:5.6.5

ARG ES_PLUGINS_INSTALL="discovery-ec2,repository-s3"

WORKDIR /usr/share/elasticsearch

RUN for plugins in $(echo $ES_PLUGINS_INSTALL | tr ',' '\n'); do elasticsearch-plugin install --batch "$plugins"; done
