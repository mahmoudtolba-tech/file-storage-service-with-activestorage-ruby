# == Schema Information
#
# Table name: documents
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  metadata   :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Document < ApplicationRecord
  has_one_attached :file

  validates :title, presence: true, length: { maximum: 255 }
  validates :file, attached: true, content_type: ['application/pdf', 'image/png', 'image/jpeg']

  # Returns the URL for the attached file (expires in 1 hour)
  def file_url
    Rails.application.routes.url_helpers.rails_blob_url(file, only_path: true, expires_in: 1.hour)
  end
end