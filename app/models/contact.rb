module Contact
  extend ActiveSupport::Concern
  
  included do  
    has_many :phone_numbers, :as => :contact
    # has_many :email_addresses, :as => :contact  
    has_one :mugshot, :as => :contact
    accepts_nested_attributes_for :mugshot   
    attr_accessible :mugshot     
  end
  
  module ClassMethods

  end
  
  module InstanceMethods
    def find_or_build_mugshot
      self.mugshot || build_mugshot
    end
  end
end