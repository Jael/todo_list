class Task < ActiveRecord::Base
  attr_accessible :title, :description, :complete
  validates_presence_of :title
  default_scope order("created_at DESC")
  belongs_to :user
end
