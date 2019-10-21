class ChangeColumnNotnullTask < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :title, :string, null: false, limit: 30
    change_column :tasks, :description, :text, null: false
  end
  def down
    change_column :tasks, :title, :string
    change_column :tasks, :description, :text
  end
end
