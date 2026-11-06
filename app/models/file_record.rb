# frozen_string_literal: true

class FileRecord < ApplicationRecord
  # Active Storage attachment
  has_one_attached :uploaded_file

  # Validations
  validates :title, presence: true, length: { maximum: 255 }
  validates :uploaded_file, attached: true, content_type: %w[image/png image/jpg image/jpeg application/pdf]

  # Scope to order by most recent
  scope :recent, -> { order(created_at: :desc) }
end