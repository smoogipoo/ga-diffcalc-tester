#!/bin/bash

set -e
set -u

generator_dir="diffcalc-sheet-generator"
generator_env="$generator_dir/.env"
google_creds_file="$generator_dir/google-credentials.json"

cp -f ".env" "$generator_env"

echo "$1" | sed -nr "s/^([^=]+)=(.*)$/\1=\2/p" | while read -r line; do
    opt=$(echo $line | sed -nr "s/^([^=]+)=(.*)$/\1/p")
    sed -i "s/^${opt}.*$/$line/" "$generator_env"
done

sed -i "s/^GH_TOKEN=.*$/GH_TOKEN=gh_secret/" "$generator_env"

echo "google_creds" > "$google_creds_file"
sed -i "s,^GOOGLE_CREDENTIALS_FILE=.*$,GOOGLE_CREDENTIALS_FILE=$google_creds_file," "$generator_env"