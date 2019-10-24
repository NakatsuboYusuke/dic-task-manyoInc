class AddColumnPriorityTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :priority, :integer, null: false, index: true
  end
end
