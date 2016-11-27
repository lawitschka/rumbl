FROM elixir:1.3

MAINTAINER Moritz Lawitschka <me@moritzlawitschka.de>

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs

# Specify Phoenix version
ENV PHOENIX_VERSION 1.2.0

# Update Mix and install Phoenix
RUN mix local.hex --force && \
    mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new-$PHOENIX_VERSION.ez

# Set up working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

# Install dependencies
RUN mix deps.get && \
    npm install

# Run server
CMD mix phoenix.server
