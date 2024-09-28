class AddEndDateToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :end_date, :datetime,null: false
  end
end
