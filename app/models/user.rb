class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: 6..20, on: :create
  has_secure_password
  has_many :tasks
end
