#!/bin/sh
#
# Usage: orcid-token.sh <CREDS_FILE>
# CREDS_FILE: json-formatted credentials for ORCID API
CREDS_FILE=$1

export $(jq -r '. | to_entries | map(.key + "=" + .value) | join(" ")' $CREDS_FILE)

curl -s -L -H "Accept: application/json" \
    -d "client_id=$orcid_client_id" \
    -d "client_secret=$orcid_client_secret" \
    -d "grant_type=client_credentials" \
    -d "scope=/read-public" \
    $orcid_token_location | jq .
