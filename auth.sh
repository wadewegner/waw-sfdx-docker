echo "hello"
sfdx --version

printenv SFDX_DEV_HUB_AUTH_URL

echo "$SFDX_DEV_HUB_AUTH_URL" > sfdxurl

sfdx force:auth:sfdxurl:store -f sfdxurl -d -a DevHub