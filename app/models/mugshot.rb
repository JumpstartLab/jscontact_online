class Mugshot < ActiveRecord::Base
  belongs_to :contact, :polymorphic => true
  
  has_attached_file :photo

  delegate :url, :to => :photo
end
