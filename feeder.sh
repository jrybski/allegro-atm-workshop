#!/bin/bash

#remove index
curl -XDELETE 'http://localhost:9200/nycpd'

# mapping template
curl -XDELETE 'http://localhost:9200/_template/nycpd_accidents' 
curl -XPUT 'http://localhost:9200/_template/nycpd_accidents -d @nyc_accidents_index_template.json'

# run logstash feeder
logstash -v -f /Users/janusz.rybski/projects/yukon/atm/nycpd_logstash.conf
