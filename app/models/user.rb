class User < ApplicationRecord

  # validation
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  before_validation { email.downcase! }
  validates :password_digest, presence: true

  has_secure_password

  # association
  has_many :tasks, dependent: :destroy

  # scope method
  scope :recent, -> { order(created_at: :desc) }

  # call_back
  before_update do
    throw :abort if User.where(admin: true).count < 2 && User.find_by(admin: true).id == self.id
  end

  before_destroy do
    throw :abort if User.where(admin: true).count < 2 && self.admin?
  end

end
