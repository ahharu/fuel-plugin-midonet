#!/bin/bash
set -e
set -x

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


#install git
apt-get install -y git

cd /tmp
git clone https://github.com/openstack/puppet-neutron.git
cd puppet-neutron
git fetch
git checkout stable/mitaka
puppet module build
puppet module install $(find . | grep .tar.gz) --ignore-dependencies --force

cd /tmp
git clone https://github.com/midonet/puppet-midonet_openstack.git
cd puppet-neutron
git fetch
puppet module build
puppet module install $(find . | grep .tar.gz) --ignore-dependencies --force

cd /tmp
git clone https://github.com/openstack/puppet-midonet.git
cd puppet-midonet
puppet module build
puppet module install $(find . | grep .tar.gz) --ignore-dependencies --force

rm -rf /tmp/puppet-neutron
rm -rf /tmp/puppet-midonet
rm -rf /tmp/puppet-midonet_openstack

cd /tmp

gem install faraday  # This is needed by the midonet providers
