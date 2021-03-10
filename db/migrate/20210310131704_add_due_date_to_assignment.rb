class AddDueDateToAssignment < ActiveRecord::Migration[6.1]
  def change
    add_column :assignments, :due_date, :datetime
  end
end
