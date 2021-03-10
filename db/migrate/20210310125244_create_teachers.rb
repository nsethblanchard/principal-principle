class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :subject
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
