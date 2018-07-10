# waw-sfdx-docker

An example docker image for the Salesforce CLI.

![sfdx-container](https://user-images.githubusercontent.com/746259/42531540-73b2c6a4-8441-11e8-8d01-36d3e47c9ce7.gif)

## Usage

Make sure you have Docker setup and working properly. Review the [Getting Started](https://docs.docker.com/get-started/) materials from Docker.

Also, make sure you install `jq`, which is used to grab the `sfdxAuthUrl` of your Dev Hub.

### Use Published Image

```
export SFDX_DEV_HUB_AUTH_URL=$(sfdx force:org:display --verbose -u <your-dev-hub> --json | jq -r .result.sfdxAuthUrl)

docker run -it -e SFDX_DEV_HUB_AUTH_URL=$SFDX_DEV_HUB_AUTH_URL wadewegner/waw-sfdx-docker:latest
```

### Run Locally

```
export SFDX_DEV_HUB_AUTH_URL=$(sfdx force:org:display --verbose -u <your-dev-hub> --json | jq -r .result.sfdxAuthUrl)

docker build -t <your-tag> .
docker image ls | <your-tag>
docker run -it -e SFDX_DEV_HUB_AUTH_URL=$SFDX_DEV_HUB_AUTH_URL <your-tag>
```