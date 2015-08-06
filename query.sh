#!/bin/bash

PROJECT_SECRET=8e6c45ec-2c74-4a13-abe1-a35711559fd9
ANALYSIS_ID=55b5ffd2f4cf7902a7c4e1ee
EXECUTION_TIME=1438609547
TIMEZONE=UTC
FORMAT=table-json
#native-json, table-json, csv

while [[ $# > 0 ]]
do
key="$1"

case $key in
    -p|--project)
    PROJECT_SECRET="$2"
    shift # past argument
    ;;
    -z|--timezone)
    PROJECT_SECRET="$2"
    shift # past argument
    ;;
    -f|--format)
    FORMAT="$2"
    shift # past argument
    ;;
    -t|--time)
    EXECUTION_TIME="$2"
    shift # past argument
    ;;
    --default)
    DEFAULT=YES
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

if PROJECT_SECRET
	do;

	exit;
done


curl -X POST https://api.infinario.com/analytics/report \
   -H "X-Infinario-Secret: $PROJECT_SECRET" \
   -H "Content-Type: application/json" \
   -d "{
        \"analysis_id\": \"$ANALYSIS_ID\", 
        \"execution_time\": $EXECUTION_TIME,
        \"timezone\": \"$TIMEZONE\",
        \"format\": \"$FORMAT\"
   }"

