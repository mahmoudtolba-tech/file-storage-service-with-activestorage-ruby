# Stage 1: Build the application
FROM ruby:3.1.2 as builder

# Set working directory to /app
WORKDIR /app

# Copy the Gemfile
COPY Gemfile* ./

# Install the gems
RUN bundle install

# Copy the application code
COPY . .

# Run database migrations
RUN rails db:migrate

# Build the application
RUN bundle exec rails assets:precompile

# Stage 2: Run the application
FROM ruby:3.1.2

# Set working directory to /app
WORKDIR /app

# Copy the application code
COPY --from=builder /app /app

# Expose port 3000 to the host
EXPOSE 3000

# Run the command to start the application
CMD ["rails", "server", "-b", "0.0.0.0"]