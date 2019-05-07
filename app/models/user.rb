class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, presence: true
  validates :email, uniqueness: true
  has_many :students
  has_many :activities
end