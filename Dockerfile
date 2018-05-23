FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs gcc
RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp
RUN bundle install
