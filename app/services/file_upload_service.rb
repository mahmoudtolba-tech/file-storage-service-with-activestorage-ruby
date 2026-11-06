# frozen_string_literal: true

# Service object responsible for handling file uploads.
class FileUploadService
  class UploadError < StandardError; end

  def initialize(repository: FileRecordRepository.new, logger: Rails.logger)
    @repository = repository
    @logger = logger
  end

  # Performs the upload.
  #
  # @param title [String] title for the file record
  # @param filename [String] original filename
  # @param file_io [IO] uploaded file IO
  # @return [FileRecord] persisted record
  # @raise [UploadError] if any business rule fails
  def call(title:, filename:, file_io:)
    validate_params!(title, filename, file_io)

    @repository.create(
      attrs: { title: title, filename: filename },
      attached_io: file_io
    )
  rescue ActiveRecord::RecordInvalid => e
    @logger.error("File upload failed: #{e.message}")
    raise UploadError, e.message
  end

  private

  def validate_params!(title, filename, file_io)
    raise UploadError, "Title cannot be blank" if title.to_s.strip.empty?
    raise UploadError, "Filename cannot be blank" if filename.to_s.strip.empty?
    raise UploadError, "File data is missing" unless file_io.respond_to?(:read)
  end
end