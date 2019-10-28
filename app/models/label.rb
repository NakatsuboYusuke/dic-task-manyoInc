class Label < ApplicationRecord

  # validation
  validates :term, presence:true, length: { maximum: 30 }

  # association
  has_many :labellings, dependent: :destroy
  has_many :tasks, through: :labellings

  #def self.set_labels(labels)
    #labels.map { |h| h[:term] }
  #end

end
