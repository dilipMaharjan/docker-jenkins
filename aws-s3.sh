#/bin/bash

DATE=$(date +%H-%H-%S)
BUCKET=db-$DATE.sql
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5

mysqldump --column-statistics=0 -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BUCKET &&\
export AWS_ACCESS_KEY_ID=AKIAR5X2JFU4COYY5LRM &&\
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET &&\
aws s3 cp /tmp/$BUCKET s3://$BUCKET_NAME/$BUCKET
