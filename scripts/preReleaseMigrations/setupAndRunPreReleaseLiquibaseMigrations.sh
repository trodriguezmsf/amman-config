#!/bin/sh

cd /tmp

wget https://raw.githubusercontent.com/bahmni-msf/amman-config/amman-release-2.2/scripts/preReleaseMigrations/run-pre-release-liquibase.sh
wget https://raw.githubusercontent.com/bahmni-msf/amman-config/amman-release-2.2/openmrs/migrations/pre-release-liquibase.xml

sh ./run-pre-release-liquibase.sh