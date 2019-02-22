FROM docker.elastic.co/elasticsearch/elasticsearch:6.6.1

ARG ES_PLUGINS_INSTALL="discovery-ec2,repository-s3"

USER root

RUN sed -i s/#networkaddress.cache.ttl=-1/networkaddress.cache.ttl=10/ $JAVA_HOME/conf/security/java.security

USER 1000

WORKDIR /usr/share/elasticsearch

RUN for plugins in $(echo $ES_PLUGINS_INSTALL | tr ',' '\n'); do elasticsearch-plugin install --batch "$plugins"; done
