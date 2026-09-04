class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :title, null: false
      t.jsonb :metadata, default: {}
      t.timestamps
    end
  end
end