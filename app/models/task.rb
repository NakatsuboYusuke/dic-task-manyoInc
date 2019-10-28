class Task < ApplicationRecord

  # validation
  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :limited_at, presence: true
  validates :status, presence: true
  validates :priority, presence: true

  # association
  belongs_to :user
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings

  # scope method
  scope :recent, -> { order(created_at: :desc) }

  # status
  enum status: { '未着手': 0, '着手中': 1, '完了': 2 }

  # priority
  enum priority: { '低': 0, '中': 1, '高': 2 }

  def self.set_index(params)
    @q = Task.ransack(params[:q])
    @tasks = @q.result.recent
  end

  # ransack method
  #def self.ransackable_attributes(auth_object = nil)
    #%w[title limited_at status priority label_id task_id term]
  #end

  #def self.ransackable_associations(auth_object = nil)
    #%w[]
  #end

  # labeles
  def save_labels(labels)
    current_labels = self.labels.pluck(:term) unless self.labels.nil?
    old_labels = current_labels - labels
    new_labels = labels - current_labels

    old_labels.each do |old_label|
      self.labels.delete Label.find_by(term: old_label)
    end

    new_labels.each do |new_label|
      task_label = Label.find_or_create_by(term: new_label)
      self.labels << task_label
    end
  end

  ransacker :status do
    Arel.sql("to_char(status, '9999999')")
  end

  def self.set_statuses
    Task.statuses_i18n.map{|key,value| [key, Task.statuses[value]]}
  end

  def self.set_status_key
    Task.statuses.keys
  end

  ransacker :priority do
    Arel.sql("to_char(priority, '9999999')")
  end

  def self.set_priorities
    Task.priorities_i18n.map{|key,value| [key, Task.priorities[value]]}
  end

  def self.set_priority_key
    Task.priorities.keys
  end

end
