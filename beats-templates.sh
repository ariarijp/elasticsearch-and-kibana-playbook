#!/bin/bash
curl -XPUT 'http://localhost:9200/_template/packetbeat' -d@/etc/packetbeat/packetbeat.template.json
curl -XPUT 'http://localhost:9200/_template/topbeat' -d@/etc/topbeat/topbeat.template.json
curl -XPUT 'http://localhost:9200/_template/filebeat?pretty' -d@/etc/filebeat/filebeat.template.json
