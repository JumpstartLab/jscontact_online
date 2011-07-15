class User < ActiveRecord::Base

  has_many :people
  has_many :companies

  def self.find_or_create_by_auth(auth_data)
    user = find_or_create_by_provider_and_uid(auth_data["provider"], auth_data["uid"], :name => auth_data["user_info"]["name"])
    unless user.name == auth_data["user_info"]["name"]
      user.update_attributes(:name => auth_data["user_info"]["name"])
    end
    return user
  end
  
  def to_s
    name
  end
end
