module Contact
  extend ActiveSupport::Concern
  
  included do  
    has_many :phone_numbers, :as => :contact
    # has_many :email_addresses, :as => :contact  
    has_one :mugshot, :as => :contact    
  end
  
  module ClassMethods

  end
  
  module InstanceMethods

  end
end