#!/bin/bash
set -e

if [ -z "$MUTATA_ROOT_PATH" ]
then
      echo -e "Please provide MUTATA_ROOT_PATH\nExample:\nexport MUTATA_ROOT_PATH=$PWD"
			exit -1
fi
source $MUTATA_ROOT_PATH/SetupEnv.sh

license_path=$MUTATA_ROOT_PATH/license.json

if [ -f $license_path ]; then
    echo "You have already downloaded a license. Please delete or backup your previous license at $license_path and retry."
    exit -1
fi

email=$1

if [ -z "$email" ]
then
      echo -e "Please provide your email\nexample: ./40-DownloadFreeLicense.sh your@email.com"
			exit -1
fi

curl --location --request POST 'https://api.mutata.io/v1/generateFreeLicense' \
-o $MUTATA_ROOT_PATH/license.json \
--silent \
--header 'Content-Type: application/json' \
--data-raw '{
    "email":"'$email'"
}'

license=$(cat $MUTATA_ROOT_PATH/license.json)
error=$(echo $license | sed 's/.*"error":"\{0,1\}\([^,"]*\)"\{0,1\}.*/\1/')

if [ "$error" == "$license" ]
then
  echo "Mutata License downloaded successfully!"
else
  echo $error
fi
