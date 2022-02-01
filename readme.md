# Dockerised Shopify CLI

## Requirements

* [Docker](https://www.docker.com/)

## Installation

Clone the repo
```bash
git clone git@github.com:oddvalue/dockerised-shopify-cli.git [PROJECT NAME]
cd [PROJECT NAME]
cp .env.example .env
cp shopify/config.example shopify/config
```

Add env variables to .env

* `STORE_URL` - The URL of the store you want to connect to

## Usage

Start Shopify CLI in Docker container

```bash
# Enter interactive docker shell 
sh ./shopify-cli
```

You'll be provided a link for your store, open it in your browser and login and you'll be dropped in to a bash shell in the docker container where you can run `shopify` commands on that store.

## Shopify CLI Docs

https://shopify.dev/themes
