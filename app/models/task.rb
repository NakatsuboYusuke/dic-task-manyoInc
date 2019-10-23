class Task < ApplicationRecord

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  #validates :limited_at, presence: true

end
