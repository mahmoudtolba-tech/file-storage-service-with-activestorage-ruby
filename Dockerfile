# ---- Builder Stage ----
FROM ruby:3.2.2-alpine AS builder
WORKDIR /app

RUN apk add --no-cache build-base postgresql-dev nodejs npm tzdata

COPY Gemfile Gemfile.lock ./
RUN bundle config set --local without 'development test' && \
    bundle install --jobs 4 --retry 3

# ---- Runtime Stage ----
FROM ruby:3.2.2-alpine
WORKDIR /app

ENV RAILS_ENV=production \
    RAILS_LOG_TO_STDOUT=1 \
    BUNDLE_PATH=/bundle

RUN apk add --no-cache postgresql-client tzdata \
    && addgroup -S app && adduser -S -G app app

COPY --from=builder /bundle /bundle
COPY --from=builder /app /app

EXPOSE 3000
ENTRYPOINT ["./entrypoint.sh"]
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]