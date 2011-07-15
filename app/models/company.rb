class Company < ActiveRecord::Base
  include Contact
  
  validates_presence_of :name, :user_id
end
