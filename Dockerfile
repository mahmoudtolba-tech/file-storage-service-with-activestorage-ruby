FROM ruby:3.1-alpine as build

WORKDIR /app

COPY Gemfile* ./

RUN bundle install

COPY . .

RUN rails db:prepare

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]