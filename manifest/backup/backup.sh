#!/bin/bash

mkdir -p ~/backup
mkdir -p ~/backup/mongo
mkdir -p ~/backup/strapi

NOW=`date '+%Y%m%d%H%M%S'`

cd /tmp/hostpath-provisioner/default

zip -r ~/backup/mongo/${NOW}.zip mongo-backup-pvc
zip -r ~/backup/strapi/${NOW}.zip strapi-pvc
