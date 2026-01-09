# API endpoint handler
class FileStorageService::API
  def initialize(service:)
    @service = service
  end

  def call(env)
    # Handle API requests
    case env['REQUEST_METHOD']
    when 'GET'
      handle_get(env)
    when 'POST'
      handle_post(env)
    when 'PUT'
      handle_put(env)
    when 'DELETE'
      handle_delete(env)
    else
      [404, {}, ['Not Found']]
    end
  rescue StandardError => e
    # Log and return 500 error
    puts "Error: #{e.message}"
    [500, {}, ['Internal Server Error']]
  end

  private

  def handle_get(env)
    id = env['REQUEST_PATH'].split('/').last

    if id == 'files'
      files = @service.list
      [200, {}, [files.to_json]]
    else
      file = @service.find(id)
      return [404, {}, ['Not Found']] if file.nil?

      [200, {}, [file.to_json]]
    end
  end

  def handle_post(env)
    # Parse JSON body
    body = Rack::Utils.parse_nested_query(env['rack.input'].read)
    file_params = { file: body['file'] }

    file = @service.create(file_params)
    return [400, {}, ['Validation Error']] if file.nil?

    [201, {}, [file.to_json]]
  end

  def handle_put(env)
    id = env['REQUEST_PATH'].split('/').last

    # Parse JSON body
    body = Rack::Utils.parse_nested_query(env['rack.input'].read)
    file_params = { file: body['file'] }

    file = @service.update(id, file_params)
    return [404, {}, ['Not Found']] if file.nil?

    [200, {}, [file.to_json]]
  end

  def handle_delete(env)
    id = env['REQUEST_PATH'].split('/').last

    deleted = @service.delete(id)
    return [404, {}, ['Not Found']] if deleted.nil?

    [204, {}, []]
  end
end