class SetupPhoneNumbersForPolymorphism < ActiveRecord::Migration
  def self.up
    rename_column :phone_numbers, :person_id, :contact_id
    add_column    :phone_numbers, :contact_type, :string
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
