FROM ruby:3.1
WORKDIR /workspaces/rorodoh
RUN bundle install --path vendor/bundle -j 4
CMD bin/rails s -b 0.0.0.0