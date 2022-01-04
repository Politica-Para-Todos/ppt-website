FROM ruby:2.7.1

# install system tools/libs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ rc main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn

# install node
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get install -y nodejs \
  && apt-get -y autoclean

# setup home directory
ENV APP_HOME /usr/src/app/
ENV PATH=$APP_HOME/bin:$PATH
WORKDIR $APP_HOME

# install locked bundler version
RUN gem install bundler -v 2.2.14
ENV BUNDLE_JOBS=4

COPY . $APP_HOME

RUN bundle install
RUN yarn install
