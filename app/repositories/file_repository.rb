# frozen_string_literal: true

# Repository pattern for FileRecord.
# Provides a thin abstraction over ActiveRecord queries, making the
# service layer easier to test and maintain.

class FileRepository
  # Returns an ActiveRecord::Relation of all files, ordered newest first.
  def all
    FileRecord.recent
  end

  # Finds a single FileRecord by ID. Raises ActiveRecord::RecordNotFound if not found.
  def find(id)
    FileRecord.find(id)
  end

  # Persists a new FileRecord with the attached ActiveStorage blob.
  # +attributes+ must contain :filename, :content_type, :byte_size, and :file (uploaded file).
  def create(attributes)
    file = attributes.delete(:file)
    record = FileRecord.new(attributes)

    raise ArgumentError, "File attachment missing" unless file.present?

    record.file.attach(file)
    record.save!
    record
  end

  # Deletes a FileRecord and its attached blob.
  def delete(id)
    record = find(id)
    record.file.purge
    record.destroy!
  end
end