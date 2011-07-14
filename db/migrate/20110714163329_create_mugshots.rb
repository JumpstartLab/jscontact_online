class CreateMugshots < ActiveRecord::Migration
  def self.up
    create_table :mugshots do |t|
      t.string :asset_file_name
      t.string :asset_content_type
      t.integer :asset_file_size
      t.datetime :asset_updated_at
      t.string :contact_type
      t.integer :contact_id
      t.timestamps
    end
  end

  def self.down
    drop_table :mugshots
  end
end
