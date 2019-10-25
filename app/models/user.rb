class User < ApplicationRecord

  # validation
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  # association
  has_many :tasks

end
