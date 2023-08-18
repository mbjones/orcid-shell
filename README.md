# ORCID API examples

Simple scripts demonstrating the usage of the ORCID API. Two scripts work in concert. First, run `orcid-token.sh` 
to generate a json-formatted token file, which is then used when running `orcid-record.sh` to retrieve
an ORCID record from the API.

## Credentials file

To run `orcid-token.sh`, you must provide a credentials file with the following format and keys in json, for example in
a file named `orcid-creds.json`:

```json
{
  "orcid_token_location": "https://pub.orcid.org/oauth/token",
  "orcid_auth_location": "https://orcid.org/oauth/authorize",
  "orcid_client_id": "APP-IRFG53FZDHGW8712",
  "orcid_client_secret": "08c351d4-51cc-3a1a-771b-2cc4554109c3"
}
```

## Typical workflow

A typical workflow would be to first authenticate, and then request a record:

```sh
$ ./orcid-token.sh orcid-creds.json > orcid-token.json
$ ./orcid-record.sh orcid-token.json 0000-0003-0077-4738 > record.json
$ cat record.json | jq .
```

```json
{
  "orcid-identifier": {
    "uri": "https://orcid.org/0000-0003-0077-4738",
    "path": "0000-0003-0077-4738",
    "host": "orcid.org"
  },
  "preferences": {
    "locale": "en"
  },
  "history": {
    "creation-method": "WEBSITE",
    "completion-date": {
      "value": 1350429396316
    },
    "submission-date": {
      "value": 1350425503705
    },
    "last-modified-date": {
      "value": 1692232096155
    },
    "claimed": true,
    "source": null,
    "deactivation-date": null,
    "verified-email": true,
    "verified-primary-email": true
  },
  "person": {
    "last-modified-date": {
      "value": 1638321862072
    },
    "name": {
      "created-date": {
        "value": 1460762851217
      },
      "last-modified-date": {
        "value": 1549075579469
      },
      "given-names": {
        "value": "Matthew"
      },
      "family-name": {
        "value": "Jones"
      },
      "credit-name": {
        "value": "Matthew B. Jones"
      },
      "source": null,
      "visibility": "public",
      "path": "0000-0003-0077-4738"
    },
    "emails": {
      "last-modified-date": {
        "value": 1549075563039
      },
      "email": [
        {
          "created-date": {
            "value": 1379924563671
          },
          "last-modified-date": {
            "value": 1549075563039
          },
          "source": {
            "source-orcid": {
              "uri": "https://orcid.org/0000-0003-0077-4738",
              "path": "0000-0003-0077-4738",
              "host": "orcid.org"
            },
            "source-client-id": null,
            "source-name": {
              "value": "Matthew B. Jones"
            },
            "assertion-origin-orcid": null,
            "assertion-origin-client-id": null,
            "assertion-origin-name": null
          },
          "email": "jones@nceas.ucsb.edu",
          "path": null,
          "visibility": "public",
          "verified": true,
          "primary": false,
          "put-code": null
        }
      ],
      "path": "/0000-0003-0077-4738/email"
    },
  },
  "path": "/0000-0003-0077-4738"
}
```

