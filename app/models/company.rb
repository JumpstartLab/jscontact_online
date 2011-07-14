class Company < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :phone_numbers, :as => :contact
end
