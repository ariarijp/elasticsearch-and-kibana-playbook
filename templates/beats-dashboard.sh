#!/bin/bash
curl -L -O https://download.elastic.co/beats/dashboards/beats-dashboards-{{ beats_dashboards_version }}.zip
unzip beats-dashboards-{{ beats_dashboards_version }}.zip
cd beats-dashboards-{{ beats_dashboards_version }}/
./load.sh
