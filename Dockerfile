# Stage 1: build the Ruby image
FROM ruby:3.2-alpine as build

WORKDIR /app

COPY . .

RUN gem install bundler
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install

# Stage 2: build the application image
FROM ruby:3.2-alpine

WORKDIR /app

COPY --from=build /app .

EXPOSE 3000

RUN bundle exec rails db:setup

CMD ["rails", "s", "-b", "0.0.0.0"]