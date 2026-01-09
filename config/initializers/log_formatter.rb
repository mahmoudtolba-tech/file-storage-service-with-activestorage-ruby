class LogFormatter
  def initialize(app)
    @app = app
  end

  def call(env)
    @app.call(env)
  rescue StandardError => e
    # Log error
    puts "Error: #{e.message}"
  end
end