FROM ruby:2.3

RUN apt-get update && apt-get install -y nodejs postgresql-client

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /opt/app
WORKDIR /opt/app

RUN RAILS_ENV=production bundle exec rake assets:precompile --trace

EXPOSE 3000

CMD bin/setup && bundle exec rails server -b 0.0.0.0 -p $PORT