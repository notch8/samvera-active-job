class CreateSearchRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :search_records do |t|
      t.string :pattern
      t.integer :count
      t.text :users

      t.timestamps
    end
  end
end
