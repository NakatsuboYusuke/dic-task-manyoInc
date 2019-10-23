class AddColumnLimitTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :limited_at, :datetime, null: false
  end
end
