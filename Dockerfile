FROM ruby:3.0.0-slim-buster

ENV APP_DIR /app
WORKDIR $APP_DIR

RUN for i in $(seq 1 8); do mkdir -p "/usr/share/man/man${i}"; done

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential vim nodejs libsqlite3-dev libpq-dev \
  && apt-get clean

ENV RAILS_ENV development

COPY Gemfile $APP_DIR
COPY Gemfile.lock $APP_DIR

RUN bundle config set path 'vendor/bundle' \
  && bundle install

COPY . $APP_DIR

RUN bundle exec rails assets:precompile

EXPOSE 3000

CMD ["/usr/local/bin/bundle", "exec", "rails", "s", "-u", "Puma", "-b", "0.0.0.0", "-p", "3000"]
