#!/bin/bash

# give them choice, if /root/.sfdx exists, use it, if not, expect envvar
if [ -f /root/.sfdx/sfdx-config.json ]; then
  echo "I see .sfdx, so I'll use auth files there"
else
  if [ -n $SFDX_DEV_HUB_AUTH_URL ]; then
    echo "using SFDX_DEV_HUB_AUTH_URL for auth"
    echo "$SFDX_DEV_HUB_AUTH_URL" > sfdxurl
    sfdx force:auth:sfdxurl:store -f sfdxurl -d -a DevHub
  else
    env
    echo "no .sfdx or ENV SFDX_DEV_HUB_AUTH_URL exists, exiting" 
    exit 1
  fi
fi



