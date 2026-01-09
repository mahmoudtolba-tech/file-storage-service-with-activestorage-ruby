# File service
class FileService
  def initialize(repository:)
    @repository = repository
  end

  def find(id)
    @repository.find(id)
  end

  def list
    @repository.list
  end

  def create(file_params)
    @repository.create(file_params)
  end

  def update(id, file_params)
    @repository.update(id, file_params)
  end

  def delete(id)
    @repository.delete(id)
  end
end