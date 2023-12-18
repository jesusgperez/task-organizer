class FixTasksColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :due_data, :due_date
  end
end
