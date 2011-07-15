module Contact
  extend ActiveSupport::Concern
  
  included do  
    has_many :phone_numbers, :as => :contact
    # has_many :email_addresses, :as => :contact  
    has_one :mugshot, :as => :contact
    accepts_nested_attributes_for :mugshot   
    attr_accessible :mugshot_attributes   
    belongs_to :user  
  end
  
  module ClassMethods

  end
  
  module InstanceMethods
    def mugshot_url(size = :thumbnail)
      mugshot.url(size)
    end
    
    def mugshot?
      !mugshot.nil?
    end
  end
end