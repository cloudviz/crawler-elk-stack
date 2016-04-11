FROM sebp/elk:latest

RUN mkdir -p /opt/elasticsearch
RUN mkdir -p /etc/logstash
RUN mkdir -p /var/log/logstash
RUN mkdir -p /opt/kibana/config

COPY elasticsearch/config /opt/elasticsearch/
COPY elasticsearch/data /opt/elasticsearch/
COPY elasticsearch/logs /opt/elasticsearch/
COPY elasticsearch/plugins /opt/elasticsearch/
COPY logstash/config/. /etc/logstash/
COPY logstash/logs/. /var/log/logstash/
COPY kibana/config/. /opt/kibana/config/
COPY supervisord.conf /supervisord.conf

EXPOSE "5601/tcp" "9200/tcp" "9300/tcp" "8080/tcp"

#ENTRYPOINT ["/usr/bin/supervisord"]
