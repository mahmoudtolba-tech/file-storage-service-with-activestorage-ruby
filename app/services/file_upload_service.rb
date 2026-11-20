# frozen_string_literal: true

# Service object responsible for handling file upload business rules.
# It validates the incoming file, delegates persistence to the repository,
# and returns a presentation hash.

class FileUploadService
  MAX_FILE_SIZE = 10.megabytes
  ALLOWED_CONTENT_TYPES = %w[image/png image/jpeg application/pdf].freeze

  def initialize(repository: FileRepository.new)
    @repository = repository
  end

  # +uploaded_file+ is an instance of ActionDispatch::Http::UploadedFile
  # Returns a hash with the stored file metadata.
  def call(uploaded_file)
    validate!(uploaded_file)

    attributes = {
      filename: uploaded_file.original_filename,
      content_type: uploaded_file.content_type,
      byte_size: uploaded_file.size,
      file: uploaded_file
    }

    record = @repository.create(attributes)

    {
      id: record.id,
      filename: record.filename,
      content_type: record.content_type,
      byte_size: record.byte_size,
      url: record.signed_url
    }
  rescue StandardError => e
    Rails.logger.error "File upload failed: #{e.message}"
    raise e
  end

  private

  def validate!(uploaded_file)
    unless uploaded_file.respond_to?(:size) && uploaded_file.respond_to?(:content_type)
      raise ArgumentError, "Invalid file object"
    end

    if uploaded_file.size.zero?
      raise ArgumentError, "File cannot be empty"
    end

    if uploaded_file.size > MAX_FILE_SIZE
      raise ArgumentError, "File exceeds maximum size of #{MAX_FILE_SIZE / 1.megabyte} MB"
    end

    unless ALLOWED_CONTENT_TYPES.include?(uploaded_file.content_type)
      raise ArgumentError, "Unsupported content type: #{uploaded_file.content_type}"
    end
  end
end