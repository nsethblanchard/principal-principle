class ChangeDueDateInAsssignments < ActiveRecord::Migration[6.1]
  def change
    change_column :assignments, :due_date, :datetime
  end
end
