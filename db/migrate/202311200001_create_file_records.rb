class CreateFileRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :file_records do |t|
      t.string :filename, null: false
      t.string :content_type, null: false
      t.bigint :byte_size, null: false
      t.timestamps
    end
  end
end