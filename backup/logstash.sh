#!/bin/bash
docker run --name logstash -d -p 5044:5044 \
  --volume "$PWD/logstash-sample.conf:/usr/share/logstash/config/logstash-sample.conf:ro" \
  --volume "certs:/etc/logstash/config/certs" \
  --volume "$PWD/logstash.yml:/usr/share/logstash/config/logstash.yml:ro" \
  --network elastic \
  docker.elastic.co/logstash/logstash:8.4.1