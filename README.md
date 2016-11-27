# Rumbl

This is the sample app from the "Programming Phoenix" book.

The Docker image takes care of installing dependencies at build time, but since
we are mounting the app directory into the container at run time, the
dependencies have to be installed manually for local development. To get up and
running:

  * Install Elixir dependencies `docker-compose run web mix deps.get`
  * Create the PostgreSQL database with `docker-compose run web mix ecto.create`
  * Migrate the database with `docker-compose run web mix ecto.migrate`
  * Install NPM dependencies `docker-compose run web npm install`
  * Start Phoenix endpoint with `docker-compose up`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
