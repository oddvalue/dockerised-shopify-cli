# Dockerised Shopify CLI

## Requirements

* [Docker](https://www.docker.com/)

## Installation

Clone the repo
```bash
git clone git@github.com:oddvalue/dockerised-shopify-cli.git [PROJECT NAME]
cd [PROJECT NAME]
```

## Usage

Start Shopify CLI in Docker container

```bash
# Enter interactive docker shell 
sh ./shopify-cli
```

You'll be provided a link for your store, open it in your browser and login and you'll be dropped in to a bash shell in the docker container where you can run `shopify` commands on that store.

The script automatically adds an env file to your project directory. The env file contains the following variables:

* `STORE_URL` - The URL of the store you want to connect to

### Serving

When serving your theme set the host to `0.0.0.0`

i.e.

```bash
shopify theme serve --host 0.0.0.0
```

Then access via `localhost:9292` on the host machine.

### Aliases

* **sti:** `shopify theme init`
* **stp:** `shopify theme pull`
* **stps:** `shopify theme push`
* **sts:** `shopify theme serve --host 0.0.0.0`
* **stc:** `shopify theme check`

## Shopify CLI Docs

https://shopify.dev/themes
