#!/bin/bash
IMAGE=jonascheng/s3-latency-probe
NAME=s3-latency-probe
BUCKET=pepper-int-backend-media-temp-video
DATE=`date -d 'yesterday' +'%Y%m%d%H%M'`
LOG=/var/log/${NAME}/${DATE}

mkdir -p ${LOG}

docker rm ${NAME} -f
docker pull ${IMAGE}
docker run --name ${NAME} -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} -e S3_BUCKET_NAME=${BUCKET} -v ${LOG}:/var/log ${IMAGE}

