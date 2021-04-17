FROM ruby:3.0.0

ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    yarn \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

EXPOSE 3000

CMD ["rails", "s"]