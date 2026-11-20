# frozen_string_literal: true

class FileRecord < ApplicationRecord
  # This model represents metadata for uploaded files.
  # The actual binary data is stored via ActiveStorage.

  has_one_attached :file

  validates :filename, presence: true
  validates :content_type, presence: true
  validates :byte_size, numericality: { only_integer: true, greater_than: 0 }

  # Scope for ordering newest first
  scope :recent, -> { order(created_at: :desc) }

  # Returns a signed URL for direct download (valid for 5 minutes)
  def signed_url
    Rails.application.routes.url_helpers.rails_blob_url(
      file,
      disposition: "attachment",
      only_path: false,
      expires_in: 5.minutes
    )
  end
end