#!/bin/bash
set -e
yum -y remove bahmni-installer #remove bahmni old version
yum -y remove httpd
cd /tmp
wget http://ci-amman.mybahmni.org:8153/go/files/Bahmni_Build/134/download/1/buildOmod/omod/bahmnimsf-1.0-SNAPSHOT.omod
yum -y install https://dl.bintray.com/bahmni/rpm/rpms/bahmni-installer-0.84-204.noarch.rpm # install bahmni latest version
curl -L https://raw.githubusercontent.com/bahmni-msf/amman-config/master/dbdump/mysql_dump.sql > /etc/bahmni-installer/deployment-artifacts/openmrs_backup.sql
cd /etc/bahmni-installer/deployment-artifacts/
curl -L https://raw.githubusercontent.com/bahmni-msf/amman-config/master/inventories/setup.yml > /etc/bahmni-installer/setup.yml
curl -L https://raw.githubusercontent.com/bahmni-msf/amman-config/master/inventories/prod > /etc/bahmni-installer/prod