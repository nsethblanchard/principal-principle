class AddHobbyToTeacher < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :hobby, :string
  end
end
