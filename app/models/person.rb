class Person < ActiveRecord::Base
  include Contact
  include PersonValidations
  
  attr_accessible :first_name, :last_name
end
