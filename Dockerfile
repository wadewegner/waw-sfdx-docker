FROM debian:stable-slim

# Configure base image
RUN apt-get update && apt-get install -y \
  wget \
  xz-utils

# Setup CLI exports
RUN export SFDX_AUTOUPDATE_DISABLE=false \
  # export SFDX_USE_GENERIC_UNIX_KEYCHAIN=true \
  export SFDX_DOMAIN_RETRY=300 \
  export SFDX_DISABLE_APP_HUB=true \
  export SFDX_LOG_LEVEL=DEBUG

# Install Salesforce CLI binary
RUN mkdir sfdx
RUN wget -qO- https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz | tar xJ -C sfdx --strip-components 1
RUN "./sfdx/install"
RUN export PATH=./sfdx/$(pwd):$PATH
RUN sfdx update
RUN sfdx --version