# frozen_string_literal: true
class FileService
  def initialize(repository = FileRepository)
    @repository = repository
  end

  def list_files
    @repository.all
  end

  def get_file(id)
    @repository.find(id)
  end

  def create_file(file)
    @repository.create(file)
  end

  def update_file(id, file)
    @repository.update(id, file)
  end

  def delete_file(id)
    @repository.destroy(id)
  end
end