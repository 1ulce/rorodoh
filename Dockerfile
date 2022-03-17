FROM ruby:3.1.0-alpine3.15
ENV PACKAGES="build-base linux-headers libxml2-dev libxslt-dev curl-dev nodejs tzdata postgresql-dev postgresql yarn less" \
    HOME="/rorodoh"

WORKDIR $HOME

ADD Gemfile      $HOME/Gemfile
ADD Gemfile.lock $HOME/Gemfile.lock

RUN apk update && \
    apk upgrade && \
    apk add --no-cache $PACKAGES && \
    bundle install -j4

ADD . $HOME

CMD ["rails", "server", "-b", "0.0.0.0"]