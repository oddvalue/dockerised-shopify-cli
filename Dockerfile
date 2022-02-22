FROM ruby as shopify-tools

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  build-essential \
  curl \
  # g++ \
  # gcc \
  git \
  unzip \
  make \
  sudo

RUN gem install shopify-cli
RUN ln -s /usr/local/bundle/bin/shopify /usr/local/bin/shopify
# in case want a rails app
RUN mkdir -p ~/.config/shopify \
    && printf "[analytics]\nenabled = false\n" > ~/.config/shopify/config

RUN curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
RUN apt install nodejs --yes

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn --yes

ARG UNAME=app
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
USER $UNAME

ENV PORT 3000

EXPOSE $PORT
EXPOSE 3456
EXPOSE 9292

ENV PATH="/usr/local/bundle/bin/:$PATH"

ENTRYPOINT ["/bin/bash", "-l", "-c"]
