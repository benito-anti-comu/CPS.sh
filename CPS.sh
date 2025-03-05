#!/bin/bash

domineo=$1

echo "questo tool puo funzionare su siti che utilizzano AWS, tutte le richieste sono con --no-sign-request."
echo

if [ -z "$domineo" ];
then
	echo "metti un domineo"
	sleep 2
	exit
fi

if command -v aws &> /dev/null
then
	echo "aws e installato"
	sleep 2
	clear
	echo "scansione di:$1"
	echo
	curl -I $1
	sleep 1
	aws s3 ls s3://$1 --no-sign-request
	sleep 1
	echo
	echo "scansione dei privilegi nel bucket..."
	aws s3api get-bucket-acl --bucket $1 --no-sign-request
	aws s3api get-bucket-policy --bucket $1  --no-sign-request
	echo
	echo "questo per ora e tutto del tool CPS, non e molto ma in futuro usciranno nuove versioni"

else
	echo "aws non e installato"
	sleep 5
	exit
fi