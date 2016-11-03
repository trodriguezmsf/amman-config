#!/bin/bash
set -e
cd /etc/bahmni-installer/
bahmni -i prod install
cd /opt/openmrs/modules/

yum -y clean all
sudo bahmni -i prod stop
sudo bahmni -i prod start
