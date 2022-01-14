# comentAR

Platform that allows you to comment and annotate political manifestos.

## Installation

### With docker

comentAR comes with a docker compose configuration files that boots the necessary PostgreSQL dependency for you, as well as building a container with all the dependencies such as the required gems and the yarn packages.

After booting the environment with `docker-compose up -d` a container named `dev` is waiting to run everything necessary.

```bash
# Shell into the dev container
docker-compose exec dev bash

# Run database migrations
bundle exec rake db:create
bundle exec rake db:migrate

# Populate database
bundle exec rake data:populate

# Boot up a rails server on port 3000
bundle exec rails server
```

If you have a webpacker error try to run this command `bundle exec rails webpacker:install -s`.

Others commands you can run inside the docker container: 

```bash
# Shell into the dev container
docker-compose exec dev bash

# Install missing dependencies
bundle install

# Boot up a rails console
bundle exec rails console

# Create yarn.lock
bundle exec rails webpacker:install -s
```

The repository directory is mounted as a volume inside the container so changes you do are reflected inside.

### Without docker

The following instructions are for the mac OS, so translate to your own environment if need be.

```bash
# Clone the repository
git clone git@github.com:Politica-Para-Todos/comentAR
cd comentAR

# Ruby 2.7
# Just use rbenv (https://github.com/rbenv/rbenv) or similar to install it
rbenv local 2.7.1

# PostgreSQL
brew install postgresql
brew services start postgresql

# Yarn
brew install yarn

# Install all ruby dependencies
gem install bundler
bundle install

# Install all yarn dependencies
yarn install

# Run database migrations
bundle exec rake db:create
bundle exec rake db:migrate

# Boot up a rails console
bundle exec rails console

# Boot up a rails server on port 3000
bundle exec rails server

# And so on...
```

## Admin console

There is an admin console available at http://localhost:3000/admin to aid in the management of data and/or the application.

## Current data model

The application implements the following data model.

### Party

The entity that represents a political party. Has many Manifestos.

### Manifesto

This is the entity that represents a political manifesto. Just holds a title attribute. It is composed by Manifesto Sections.

### Manifesto Sections

As manifestos are quite large, they are usually divided into sections. Each section may have sub sections ad nauseam. A section has a content attribute that generally represents its title, and a markdown document with all its textual content.

The markdown document in each section is automatically converted into Manifesto Items when the section is created or updated.

### Manifesto Items

A paragraph, header or list item in a manifesto. Each one is individually commentable and annotateable. Each has a numeric unique private key, as well as a hash that identifies them uniquely in the system.

When its Manifesto Section is updated using a slightly different document, only the items that are different are replaced, the others are just updated in order not to mitigate the loss of comments or annotations.

### Comments

A regular comment by a regular user. Not to be confused with the current Comments tab on the admin console, which is a feature of the library that implements it.

### User

A user that signs up in the platform. May have email credentials or authenticate via oauth from twitter, facebook or google.

### AdminUser

A user that manages the platform. _This is not a User, nor has anything to do with the User entity._ 

## Populating the database

There is a handy rake task that populates the database from a JSON file with a given format. You can run it by evoking:

```bash
bundle exec rake data:populate
```

By default it will use the file available at `db/seeds.json` as input, but you can point it to any URL. For example, if you want it to populate the database from a JSON you uploaded to GitHub Gists, just give it its URL. Make sure to point to the _raw_ link.

```bash
bundle exec rake 'data:populate[https://gist.githubusercontent.com/punnie/a119b9138ceed7a1d63a22a5fb3c0bab/raw/e9f8735950423a690f190789023e558c71c045a5/candidates.json]'
```

Observe the single quotes around the rake task specification and the URL. You must use it or else your shell will complain.

If you want to run it in the context of an environment, such as staging or production, you must have `heroku` tools installed and configured, and run it as such:

```bash
heroku run bundle exec rake data:populate --app politica-para-todos
```

If the database already has data run:

```bash
heroku run bundle exec rake db:migrate --app politica-para-todos
heroku run bundle exec rake data:populate --app politica-para-todos
```

### Idempotency

The rake task will match existing Parties by their _acronym_, which means that if there is an acronym change, a new Party will be created.

Likewise, it will match existing Candidates by their Party ID, district and position. The name might be a good candidate, but with so many corrections at boot I wasn't sure it would be a good idea.
