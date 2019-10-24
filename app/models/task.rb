class Task < ApplicationRecord

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :limited_at, presence: true
  validates :status, presence: true
  validates :priority, presence: true

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
  def self.ransackable_attributes(auth_object = nil)
    %w[title limited_at status priority]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[]
  end

  private

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
    Arel.sql("to_char(status, '9999999')")
  end

  def self.set_priorities
    Task.priorities_i18n.map{|key,value| [key, Task.priorities[value]]}
  end

  def self.set_priority_key
    Task.priorities.keys
  end

end
