#!/bin/bash
set -e
yum -y remove bahmni-installer #remove bahmni old version
yum -y remove httpd
cd /tmp
wget https://bahmni-msf.s3.amazonaws.com/artifacts/1.0/bahmnimsf-1.0-SNAPSHOT.omod
yum -y install https://dl.bintray.com/bahmni/rpm/rpms/bahmni-installer-0.84-204.noarch.rpm # install bahmni latest version
cd /etc/bahmni-installer/deployment-artifacts/
curl -L https://raw.githubusercontent.com/bahmni-msf/amman-config/release-1.0/inventories/setup.yml > /etc/bahmni-installer/setup.yml
curl -L https://raw.githubusercontent.com/bahmni-msf/amman-config/release-1.0/inventories/prod > /etc/bahmni-installer/prod

if [ ! -f "/etc/bahmni-installer/prod" ];
then
	echo "prod inventory file not found ";
	exit;
fi
if [ ! -r /etc/bahmni-installer/setup.yml ];
then
	echo "setup.yml file not found ";
	exit;
fi
if [ ! -e /tmp/bahmnimsf-1.0-SNAPSHOT.omod ];
then
	echo "bahmnimsf mode not found ,Kindly download it";
	exit;
fi
cd /etc/bahmni-installer/deployment-artifacts
rm -rf amman-config*
rm -rf amman_config*
wget https://github.com/bahmni-msf/amman-config/archive/release-1.0.zip
unzip release-1.0.zip
mv amman-config-release-1.0 amman_config