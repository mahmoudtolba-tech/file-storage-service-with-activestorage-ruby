class FileModel < ApplicationRecord
  has_one_attached :file

  validates :file, presence: true

  def self.all
    order(created_at: :desc)
  end
end