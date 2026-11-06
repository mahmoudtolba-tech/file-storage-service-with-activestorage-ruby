# frozen_string_literal: true

class CreateFileRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :file_records do |t|
      t.string :title, null: false
      t.string :filename, null: false

      t.timestamps
    end
  end
end