class User < ApplicationRecord
  # has_many :tasks
  validates :name, presence: true, length: { maximum: 30 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
end
