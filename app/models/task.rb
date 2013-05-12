class Task < ActiveRecord::Base
  attr_accessible :title, :description, :complete, :tag_list
  validates_presence_of :title
  default_scope order("created_at DESC")
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def tag_list
    tags.map(&:name).join(", ")
  end
  
  def self.tagged_with(tag, uid, complete)
    Tag.find_by_name(tag).tasks.where(complete: complete, user_id: uid)
  end
end
