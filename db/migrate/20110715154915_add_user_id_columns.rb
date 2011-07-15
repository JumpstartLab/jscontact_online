class AddUserIdColumns < ActiveRecord::Migration
  def self.up
    add_column :people, :user_id, :integer
    add_column :companies, :user_id, :integer
  end

  def self.down
    remove_column :people, :user_id
    remove_column :companies, :user_id
  end
end
