class User < ActiveRecord::Base
  validates :email, presence: true

  has_secure_password

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end
end
