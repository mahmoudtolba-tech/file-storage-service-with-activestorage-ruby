# -------------------------------------------------
#  Build Stage
# -------------------------------------------------
FROM ruby:3.2.2-alpine AS builder

# Install dependencies
RUN apk add --no-cache \
    build-base \
    postgresql-dev \
    nodejs \
    yarn \
    tzdata \
    git

# Set workdir
WORKDIR /app

# Install bundler
ENV BUNDLE_PATH=/bundle
ENV BUNDLE_WITHOUT="development test"

# Copy Gemfile and lock
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local deployment 'true' && \
    bundle install --jobs 4 --retry 3

# -------------------------------------------------
#  Runtime Stage
# -------------------------------------------------
FROM ruby:3.2.2-alpine

# Install runtime dependencies
RUN apk add --no-cache \
    postgresql-client \
    libpq \
    nodejs \
    tzdata

WORKDIR /app

# Copy bundle from builder
COPY --from=builder /bundle /usr/local/bundle
COPY . .

# Precompile assets (if any)
RUN bundle exec rails assets:precompile RAILS_ENV=production

EXPOSE 3000

# Entrypoint
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]