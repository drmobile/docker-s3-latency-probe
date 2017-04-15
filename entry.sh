#!/bin/bash

S3_HOSTNAME=${S3_BUCKET_NAME}.s3-${AWS_DEFAULT_REGION}.amazonaws.com

echo
echo "============================================="
echo "traceroute -T ${S3_HOSTNAME}"
echo
traceroute -T ${S3_HOSTNAME}

echo
echo "============================================="
echo "mtr -r ${S3_HOSTNAME}"
echo
mtr -r ${S3_HOSTNAME}

echo
echo "============================================="
echo "curl -vvv ${S3_HOSTNAME}"
echo
curl -vvv ${S3_HOSTNAME} >> /dev/null

echo
echo "============================================="
echo "aws s3 cp test.mp4 s3://${S3_BUCKET_NAME} --debug"
echo
aws s3 cp test.mp4 s3://${S3_BUCKET_NAME} --region ${AWS_DEFAULT_REGION} --debug

echo
echo "============================================="
echo "aws s3 cp s3://${S3_BUCKET_NAME}/test.mp4 . --debug"
echo
aws s3 cp s3://${S3_BUCKET_NAME}/test.mp4 . --region ${AWS_DEFAULT_REGION} --debug


