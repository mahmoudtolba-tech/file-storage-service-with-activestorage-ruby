# frozen_string_literal: true
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
    File.find(id).update(file)
  end

  def self.destroy(id)
    File.find(id).destroy
  end
end