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
rake db:migrate

# Boot up a rails console
rails console

# Boot up a rails server on port 3000
rails server

# And so on..
```

The repository directory is mounted as a volume inside the container so changes you do are reflected inside.

### Without docker

The following instructions are for the mac OS, so translate to your own environment if need be.

```bash
# Clone the repository
git clone git@github.com:Politica-Para-Todos/comentAR
cd comentAR

# Ruby 2.6
# Just use rbenv (https://github.com/rbenv/rbenv) or similar to install it
rbenv local 2.6.4

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
