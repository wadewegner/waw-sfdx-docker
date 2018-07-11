# waw-sfdx-docker

A docker image you can use for active Salesforce DX development.

<img src="assets/dockerfordx.gif" width="600px" />

## Usage

Make sure you have Docker setup and working properly. Review the [Getting Started](https://docs.docker.com/get-started/) materials from Docker.

Also, make sure you install `jq`, which is used to grab the `sfdxAuthUrl` of your Dev Hub.

### Use Published Image

Follow these instructions if you want to use my published image.

```
export SFDX_DEV_HUB_AUTH_URL=$(sfdx force:org:display --verbose -u <your-dev-hub> --json | jq -r .result.sfdxAuthUrl)

docker run -dit --name <your-name> -e SFDX_DEV_HUB_AUTH_URL=$SFDX_DEV_HUB_AUTH_URL wadewegner/waw-sfdx-docker:latest
docker exec -i -t <your-name> /bin/bash
```

### Build Locally

Follow these instructions if you want to build your own image locally.

```
export SFDX_DEV_HUB_AUTH_URL=$(sfdx force:org:display --verbose -u <your-dev-hub> --json | jq -r .result.sfdxAuthUrl)

docker build -t <your-tag> .
docker image ls | <your-tag>
docker run -dit --name <your-name> -e SFDX_DEV_HUB_AUTH_URL=$SFDX_DEV_HUB_AUTH_URL <your-tag>
docker exec -i -t <your-name> /bin/bash
```