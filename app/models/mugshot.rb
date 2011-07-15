class Mugshot < ActiveRecord::Base
  belongs_to :contact, :polymorphic => true
  
  has_attached_file :photo, :styles => { :thumbnail => "30x30>", :medium => "100x100>" }

  delegate :url, :to => :photo
end
