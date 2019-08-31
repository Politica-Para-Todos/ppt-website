FROM ruby:2.6.3

# install system tools/libs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ rc main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn

# setup home directory
ENV APP_HOME /usr/src/app/
ENV PATH=$APP_HOME/bin:$PATH
WORKDIR $APP_HOME

# install locked bundler version
RUN gem install bundler -v 2.0.2
ENV BUNDLE_JOBS=4

COPY Gemfile Gemfile.lock $APP_HOME
RUN bundle install

COPY package.json yarn.lock $APP_HOME
RUN yarn

COPY . $APP_HOME
