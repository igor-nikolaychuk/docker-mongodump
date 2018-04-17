#!/bin/bash
sleep 10 #Wait for mongod to start

FILENAME=$(date +%Y_%m_%d__%H_%M).tar.gz
echo "Dumping from "$MONGODB_HOST" database "$DB

while [[ true ]]; do
	mongodump --host $MONGODB_HOST --gzip --archive=$FILENAME
	
	COMMAND="${UPLOAD_COMMAND} ${FILENAME}"
	echo $COMMAND
	eval $COMMAND
	rm $FILENAME

	sleep $BACKUP_INTEVAL;
done