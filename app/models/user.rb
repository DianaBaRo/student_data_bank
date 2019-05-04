class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, presence: true
  validates :email, uniqueness: true
  has_many :students
  has_many :activities

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end
end