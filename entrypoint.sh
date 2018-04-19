#!/bin/bash
sleep 10 #Wait for mongod to start


while [[ true ]]; do
	FILENAME=$(date +%Y_%m_%d__%H_%M).tar.gz
	echo "Dumping from "$MONGODB_HOST" database "$DB

	mongodump --host $MONGODB_HOST --gzip --archive=$FILENAME
	
	COMMAND="${UPLOAD_COMMAND} ${FILENAME}"
	echo $COMMAND
	eval $COMMAND
	rm $FILENAME

	echo $BACKUP_INTEVAL" timeout..."
	sleep $BACKUP_INTEVAL;
done