#!/bin/bash
docker run -d \
  --name=filebeat \
  --user=root \
  --volume="$(pwd)/filebeat.docker.yml:/usr/share/filebeat/filebeat.yml:ro" \
  --volume="/var/lib/docker/containers:/var/lib/docker/containers:ro" \
  --volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
  --volume="/Users/kang-yunsik/Project/elasticsearch/compose/certs:/etc/client" \
  --volume="/Users/kang-yunsik/logback/syslog:/var/log:ro"
  --network compose_elastic \
  docker.elastic.co/beats/filebeat:8.4.1 filebeat -e --strict.perms=false
