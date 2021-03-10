class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :content
      t.boolean :completed, default: false, null: false
      t.string :letter_grade
      t.belongs_to :teacher, null: false, foreign_key: true
      t.belongs_to :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
