# frozen_string_literal: true

# Repository pattern for FileRecord data access.
class FileRecordRepository
  # Find a FileRecord by ID.
  #
  # @param id [Integer] the primary key
  # @return [FileRecord, nil]
  def find(id)
    FileRecord.find_by(id: id)
  end

  # Persist a new FileRecord.
  #
  # @param attrs [Hash] attributes for creation
  # @param attached_io [IO] file IO object to attach
  # @return [FileRecord] the persisted record
  # @raise [ActiveRecord::RecordInvalid] if validation fails
  def create(attrs:, attached_io:)
    FileRecord.transaction do
      record = FileRecord.new(attrs)
      record.uploaded_file.attach(io: attached_io, filename: attrs[:filename])
      record.save!
      record
    end
  end

  # Delete a FileRecord.
  #
  # @param id [Integer] the primary key
  # @return [Boolean] true if destroyed
  def destroy(id)
    record = find(id)
    return false unless record

    record.destroy!
    true
  end
end