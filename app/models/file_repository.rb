# File repository
class FileRepository
  def initialize
    @files = File.all
  end

  def find(id)
    File.find(id)
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def list
    @files
  end

  def create(file_params)
    file = File.new(file_params)
    file.save!
    file
  rescue ActiveRecord::RecordInvalid => e
    # Log and re-raise
    puts "Validation error: #{e.message}"
    raise
  end

  def update(id, file_params)
    file = find(id)
    return nil if file.nil?

    file.update(file_params)
    file
  rescue ActiveRecord::RecordNotFound
    nil
  rescue ActiveRecord::RecordInvalid => e
    # Log and re-raise
    puts "Validation error: #{e.message}"
    raise
  end

  def delete(id)
    file = find(id)
    return nil if file.nil?

    file.destroy
    true
  rescue ActiveRecord::RecordNotFound
    nil
  end
end