class CreateMugshots < ActiveRecord::Migration
  def self.up
    create_table :mugshots do |t|
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at
      t.string :contact_type
      t.integer :contact_id
      t.timestamps
    end
  end

  def self.down
    drop_table :mugshots
  end
end
