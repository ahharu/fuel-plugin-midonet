#!/bin/bash

puppet module install puppetlabs-java --version=1.6.0 --ignore-dependencies --force
puppet module install locp-cassandra --version=1.25.2 --ignore-dependencies --force
puppet module install puppetlabs-inifile --version=1.5.0 --ignore-dependencies --force
puppet module install puppetlabs-apt --version=2.2.2 --ignore-dependencies --force
puppet module install puppetlabs-stdlib --version=4.12.0 --ignore-dependencies --force
puppet module install puppetlabs-apache --version=1.10.0 --ignore-dependencies --force
puppet module install puppetlabs-concat --version=2.2.0 --ignore-dependencies --force
puppet module install TubeMogul-curator --version=1.0.1 --ignore-dependencies --force
puppet module install elasticsearch-elasticsearch --version=0.13.2 --ignore-dependencies --force
puppet module install elasticsearch-logstash --version=0.6.4 --ignore-dependencies --force
puppet module install electrical-file_concat --version=1.0.1 --ignore-dependencies --force
puppet module install richardc-datacat --version=0.6.2 --ignore-dependencies --force

gem install faraday  # This is needed by the midonet providers
