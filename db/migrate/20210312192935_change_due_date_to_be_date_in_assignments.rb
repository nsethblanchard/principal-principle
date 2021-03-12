class ChangeDueDateToBeDateInAssignments < ActiveRecord::Migration[6.1]
  def change
    change_column :assignments, :due_date, :date
  end
end
