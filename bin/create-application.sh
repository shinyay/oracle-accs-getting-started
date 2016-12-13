#!/bin/sh
if [ $# -ne 6 ]; then
  echo "COMMAND <CLOUD_ID> <CLOUD_PWD> <IDDOMAIN> <APP_NAME> <CONTAINER_NAME> <FILE_NAME>"
  exit 1
fi
CLOUD_ID=${1}
CLOUD_PWD=${2}
IDDOMAIN=${3}
APP_NAME=${4}
CONTAINER_NAME=${5}
FILE_NAME=${6}

curl -i -X POST -u ${CLOUD_ID}:${CLOUD_PWD} \
-H "Content-Type: multipart/form-data" \
-H "Accept: application/json" \
-H "X-ID-TENANT-NAME: ${IDDOMAIN}" \
-F "name=${APP_NAME}" \
-F "runtime=java" \
-F "subscription=hourly" \
-F "archiveURL=${CONTAINER_NAME}/${FILE_NAME}" \
-F "deployment=@deployment.json" \
https://psm.europe.oraclecloud.com/paas/service/apaas/api/v1.1/apps/${IDDOMAIN}
