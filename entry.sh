#!/bin/bash


S3_HOSTNAME=${S3_BUCKET_NAME}.s3-${AWS_DEFAULT_REGION}.amazonaws.com

for hostname in ${S3_HOSTNAME} api-integ.soocii.me api-staging.soocii.me api.soocii.me
do
    echo
    echo "============================================="
    echo "traceroute -T ${hostname}"
    echo
    traceroute -T ${hostname}

    echo
    echo "============================================="
    echo "mtr -rnc 200 ${hostname}"
    echo
    mtr -rnc 200 ${hostname}
done

echo
echo "============================================="
echo "curl -vvv ${S3_HOSTNAME}"
echo
curl -vvv ${S3_HOSTNAME} >> /dev/null

echo
echo "============================================="
echo "aws s3 cp test.mp4 s3://${S3_BUCKET_NAME} --region ${AWS_DEFAULT_REGION} --debug"
echo
aws s3 cp test.mp4 s3://${S3_BUCKET_NAME} --region ${AWS_DEFAULT_REGION} --debug

echo
echo "============================================="
echo "aws s3 cp s3://${S3_BUCKET_NAME}/test.mp4 . --region ${AWS_DEFAULT_REGION} --debug"
echo
aws s3 cp s3://${S3_BUCKET_NAME}/test.mp4 . --region ${AWS_DEFAULT_REGION} --debug


