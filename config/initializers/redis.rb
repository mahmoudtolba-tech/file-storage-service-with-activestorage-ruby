# frozen_string_literal: true

Redis.current = Redis.new(
  url: ENV.fetch("REDIS_URL") { "redis://redis:6379/1" },
  reconnect_attempts: 1
)