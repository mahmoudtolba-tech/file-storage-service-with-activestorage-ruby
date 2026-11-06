# frozen_string_literal: true
# -------------------------------------------------
# Multi‑stage Dockerfile for the FileStorageService
# -------------------------------------------------

# ---------- Builder Stage ----------
FROM ruby:3.2.2-alpine AS builder

# Install system dependencies
RUN apk add --no-cache \
    build-base \
    postgresql-dev \
    nodejs \
    yarn \
    tzdata \
    libxml2-dev \
    libxslt-dev \
    imagemagick \
    shared-mime-info

# Set working directory
WORKDIR /app

# Install bundler
RUN gem install bundler -v 2.4.22

# Copy Gemfile and lockfile
COPY Gemfile Gemfile.lock ./

# Install gems (without development group)
RUN bundle config set --local without 'development test' && \
    bundle install --jobs 4 --retry 3

# ---------- Runtime Stage ----------
FROM ruby:3.2.2-alpine

# Install runtime dependencies
RUN apk add --no-cache \
    postgresql-client \
    libxml2 \
    libxslt \
    imagemagick \
    tzdata \
    shared-mime-info

# Set environment variables
ENV RAILS_ENV=production \
    RACK_ENV=production \
    BUNDLE_WITHOUT=development:test

# Create unprivileged user
RUN addgroup -S app && adduser -S app -G app
USER app

# Set working directory
WORKDIR /app

# Copy only the necessary files from builder
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /app .

# Copy the rest of the application code
COPY . .

# Precompile assets (if any)
RUN bundle exec rails assets:precompile

# Expose port
EXPOSE 3000

# Start the server
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]