# frozen_string_literal: true
class CreateFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :files do |t|
      t.string :name
      t.string :file_extension

      t.timestamps
    end
  end
end