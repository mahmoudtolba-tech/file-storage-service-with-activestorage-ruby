class File < ApplicationRecord
  has_one_attached :upload
  validates :upload, presence: true
end