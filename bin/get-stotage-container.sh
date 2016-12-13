#!/bin/sh

if [ $# -ne 3 ]; then
  echo "<CLOUD_ID> <CLOUD_PWD> <IDDOMAIN>"
  exit 1;
fi

CLOUD_ID=${1}
CLOUD_PWD=${2}
IDDOMAIN=${3}

curl -X GET -u ${CLOUD_ID}:${CLOUD_PWD} https://${IDDOMAIN}.storage.oraclecloud.com/v1/Storage-${IDDOMAIN}/

