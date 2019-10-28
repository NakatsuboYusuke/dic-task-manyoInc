class Labelling < ApplicationRecord

  # validation
  #validates :task_id, presence:true
  #validates :label_id, presence:true

  # association
  belongs_to :task
  belongs_to :label

end
