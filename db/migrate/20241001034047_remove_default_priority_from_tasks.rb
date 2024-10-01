class RemoveDefaultPriorityFromTasks < ActiveRecord::Migration[7.1]
  def change
      change_column :tasks, :priority, :integer, default: nil
  end
end
