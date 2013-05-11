class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: 6..20
  has_secure_password
end
