class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  validates :username,
    uniqueness: true,
    presence: true
end
