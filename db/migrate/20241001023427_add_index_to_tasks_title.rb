class AddIndexToTasksTitle < ActiveRecord::Migration[7.1]
  def change
      add_index :tasks, :title
  end
end
