class FileRepository
  def all
    FileModel.all
  end

  def find(id)
    FileModel.find(id)
  end

  def create(params)
    FileModel.create(params)
  end

  def update(id, params)
    file = find(id)
    file.update(params)
  end

  def delete(id)
    file = find(id)
    file.destroy
  end
end