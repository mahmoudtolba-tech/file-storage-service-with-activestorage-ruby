FROM ruby:3.1.2-alpine as build

WORKDIR /app

COPY . .

RUN gem install bundler

RUN bundle config set path 'vendor/bundle'
RUN bundle install

RUN rails db:setup
RUN rails db:migrate

FROM ruby:3.1.2-alpine

WORKDIR /app

COPY --from=build /app .

ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]