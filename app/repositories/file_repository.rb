class FileRepository
  def self.all
    File.all
  end

  def self.find(id)
    File.find(id)
  end

  def self.create(file)
    File.create(file)
  end

  def self.update(id, file)
    file_obj = File.find(id)
    file_obj.update(file)
  end

  def self.destroy(id)
    File.find(id).destroy
  end
end