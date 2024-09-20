class AddIndexToTasksTitle < ActiveRecord::Migration[7.1]
  def change
      add_index :tasks, :title, unique: true
  end
end
