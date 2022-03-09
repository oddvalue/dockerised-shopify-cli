#!/bin/sh

if [ ! -f .env ]; then
  echo 'Enter the shop URL:'
  read SHOP_URL
  echo "STORE_URL=$SHOP_URL" > .env
fi

unamestr=$(uname)
if [ "$unamestr" = 'Linux' ]; then
  export $(grep -v '^#' .env | xargs -d '\n')
elif [ "$unamestr" = 'FreeBSD' ]; then
  export $(grep -v '^#' .env | xargs -0)
elif [ "$unamestr" = 'Darwin' ]; then
  source .env
fi

if [ -z "$STORE_URL" ]; then
  echo 'STORE_URL is not set in .env'
  exit 1
fi

if [ ! -f home/.config/shopify/config ]; then
  mkdir -p home/.config/shopify
  echo "[analytics]\nenabled = false\n\n[features]\nshopifolk = false" > home/.config/shopify/config
fi

if [ "$(docker images -q shopify-cli:latest 2> /dev/null)" = "" ]; then
  sh build.sh
fi

docker run --rm -it \
  -p 3456:3456 \
  -p 9292:9292 \
  -u "$(id -u):$(id -g)" \
  -v "$PWD/home/:/home/app/" \
  -v $PWD:/app \
  -v ~/.ssh:/home/app/.ssh \
  -w /app/theme \
  shopify-cli:latest \
  -c "shopify login --store=$STORE_URL; bash"
