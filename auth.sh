#!/usr/bin/env bash

echo "$SFDX_DEV_HUB_AUTH_URL" > sfdxurl
sfdx force:auth:sfdxurl:store -f sfdxurl -d -a DevHub