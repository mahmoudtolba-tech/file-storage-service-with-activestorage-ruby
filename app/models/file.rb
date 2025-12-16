# frozen_string_literal: true
class File < ApplicationRecord
  has_one_attached :file_data

  validates :name, presence: true

  def file_extension
    File.extname(name)
  end
end