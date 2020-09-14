FROM ruby:2.6.6-alpine

RUN apk update \
  && apk upgrade \
  && apk add --update \
    tzdata \
    git \
    linux-headers \
    build-base \
    sqlite-dev \
    postgresql-dev \
  && rm -rf /var/cache/apk/*

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
