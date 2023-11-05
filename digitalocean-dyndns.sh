#!/bin/bash

while getopts d:r:t: FLAG
do
    case "$FLAG" in
        d) DOMAIN=$OPTARG;;
        r) RECORD_ID=$OPTARG;;
        t) TOKEN=$OPTARG;;
    esac
done

CURRENT_IPV4="$(dig +short myip.opendns.com @resolver1.opendns.com)"
LAST_IPV4="$(tail -1 $LOG_FILE | awk -F, '{print $2}')"
LOG_FILE="/var/log/digitalocean-dyndns.log"

if [ "$CURRENT_IPV4" != "$LAST_IPV4" ]; then
    echo "$(date),$CURRENT_IPV4" >> "$LOG_FILE"
    curl -X PUT -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -d '{"data":"'"$CURRENT_IPV4"'"}' "https://api.digitalocean.com/v2/domains/$DOMAIN/records/$RECORD_ID" > /dev/null
fi
