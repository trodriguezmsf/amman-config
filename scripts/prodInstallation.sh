#!/bin/bash
set -e
# prod inventory file should be present with updated IP address
# setup.yml should be present and should have right url 
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
cd /etc/bahmni-installer/
bahmni -i prod install
cd /opt/openmrs/modules/

yum -y clean all
sudo bahmni -i prod stop
sudo bahmni -i prod start
