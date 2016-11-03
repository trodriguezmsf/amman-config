#!/bin/bash
set -e
yum -y remove bahmni-installer #remove bahmni old version
yum -y remove httpd
cd /tmp
wget http://ci-amman.mybahmni.org:8153/go/files/Bahmni_Build/134/download/1/buildOmod/omod/bahmnimsf-1.0-SNAPSHOT.omod
yum -y install https://dl.bintray.com/bahmni/rpm/rpms/bahmni-installer-0.84-204.noarch.rpm # install bahmni latest version
cd /etc/bahmni-installer/deployment-artifacts/
curl -L https://raw.githubusercontent.com/bahmni-msf/amman-config/master/inventories/setup.yml > /etc/bahmni-installer/setup.yml
curl -L https://raw.githubusercontent.com/bahmni-msf/amman-config/master/inventories/prod > /etc/bahmni-installer/prod

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
wget https://github.com/bahmni-msf/amman-config/archive/master.zip
unzip master.zip
mv amman-config-master amman_config