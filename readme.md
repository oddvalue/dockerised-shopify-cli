# Dockerised Shopify CLI

## Requirements

* [Docker](https://www.docker.com/)

## Installation

Clone the repo
```bash
git clone git@github.com:oddvalue/dockerised-shopify-cli.git [PROJECT NAME]
cd [PROJECT NAME]
cp .env.example .env
```

Add env variables to .env

* `STORE_URL` - The URL of the store you want to connect to

## Usage

Start Shopify CLI in Docker container

```bash
# Enter interactive docker shell 
sh ./shopify-cli
```

## Shopify CLI Docs

https://shopify.dev/themes
