class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, presence: true
  validates :email, uniqueness: true
  has_many :students
  has_many :activities

  def greeting
    if nursery_staff
      "Find below all our students, #{self.username}"
    else
      "Find below the link/s to your kid/s profile/s, #{self.username}"
    end
  end
end