class FileService
  def initialize(repository = FileRepository.new)
    @repository = repository
  end

  def all
    @repository.all
  end

  def find(id)
    @repository.find(id)
  end

  def create(params)
    @repository.create(params)
  end

  def update(id, params)
    @repository.update(id, params)
  end

  def delete(id)
    @repository.delete(id)
  end
end