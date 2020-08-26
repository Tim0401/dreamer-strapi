#!/bin/bash

mkdir -p ~/backup
mkdir -p ~/backup/mongo
mkdir -p ~/backup/strapi

cd ~/backup/mongo
NOW=`date '+%Y%m%d%H%M%S'`
zip -r ${NOW}.zip /tmp/hostpath-provisioner/mongo-backup-pvc

cd ~/backup/strapi
zip -r ${NOW}.zip /tmp/hostpath-provisioner/strapi-pvc
