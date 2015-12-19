#!/bin/bash
curl -L -O http://download.elastic.co/beats/dashboards/beats-dashboards-{{ beats_dashboards_version }}.tar.gz
tar xzvf beats-dashboards-{{ beats_dashboards_version }}.tar.gz
cd beats-dashboards-{{ beats_dashboards_version }}/
./load.sh
