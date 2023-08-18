#!/bin/sh
#
# Usage: orcid-record.sh <TOKEN_FILE> <ORCID>
# TOKEN_FILE is json-formatted file from orcid-token.sh
# ORCID is bare ORCID identifier
TOKEN_FILE=$1
ORCID=$2
API_BASE="https://api.orcid.org/v3.0"

TOKEN=$(jq -r '.access_token' $TOKEN_FILE)
curl -s -L \
    -H "Accept: application/json" \
    -H "Authorization: Bearer ${TOKEN}" \
    ${API_BASE}/${ORCID}/record | jq .
