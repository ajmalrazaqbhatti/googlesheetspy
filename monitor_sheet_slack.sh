#!/bin/bash
echo "=== Welcome to Google Sheet Data Lookup ==="
echo "Author: Ajmal Razaq Bhatti (github.com/ajmalrazaqbhatti)"
read -p "Enter Google Sheet Web Publish CSV URL: " url
read -p "Enter Slack Webhook URL: " slackurl
OldData="/tmp/sheet_data_old.csv"
NewData="/tmp/sheet_data_new.csv"
OldHashFile="/tmp/sheet_data_hash.txt"
touch "$OldData" "$OldHashFile"
echo "Monitoring for changes in Google Sheet... (Press Ctrl+C to stop)"
while true; do
    wget -q --no-cache --no-check-certificate -O "$NewData" "$url"
    if [ ! -s "$NewData" ]; then
        echo "Error: Failed to download data. Retrying..."
        sleep 5
        continue
    fi
    tr -d '\r' < "$NewData" | sed '/^[[:space:]]*$/d' > "/tmp/sheet_data_new_clean.csv"
    NewHash=$(md5sum "/tmp/sheet_data_new_clean.csv" | awk '{print $1}')
    OldHash=$(cat "$OldHashFile" 2>/dev/null || echo "")
    if [[ "$NewHash" != "$OldHash" ]]; then
        TIMESTAMP=$(date +'%Y-%m-%d %H:%M:%S')
        echo "[$TIMESTAMP] Change detected in Google Sheet!"
        curl -X POST -H 'Content-type: application/json' \
             --data "{\"text\": \"📢 *New changes detected in Google Sheet!*\"}" "$slackurl"
        echo "$NewHash" > "$OldHashFile"
        mv "/tmp/sheet_data_new_clean.csv" "$OldData"
    else
        echo "[$(date +'%Y-%m-%d %H:%M:%S')] No changes detected..."
    fi
    sleep 5
done
