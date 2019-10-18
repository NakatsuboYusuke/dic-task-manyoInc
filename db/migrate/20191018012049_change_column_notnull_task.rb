class ChangeColumnNotnullTask < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :title, :string, limit: 30, null: false
    change_column_null :tasks, :description, false
  end
  def down
    change_column :tasks, :title, :string
    change_column :tasks, :description, :text
  end
end
