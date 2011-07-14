module PersonValidations
  extend ActiveSupport::Concern

  included do
    validates_presence_of :first_name, :last_name  
  end
end