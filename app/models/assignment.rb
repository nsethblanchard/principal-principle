class Assignment < ApplicationRecord
  belongs_to :teacher
  belongs_to :student

  validates :title, :content, :due_date, presence: true

  
  scope :alpha, -> { order (:content) }  

  scope :overdue_assignments, -> (date) { where("due_date < ?", date) && where("completed == false") }

  # def self.search(search)
  #   if search
  #     stu = Student.find_by(first_name: search)
      
  #     if stu
  #       Student.where("first_name LIKE ?", search) 
  #     else
  #       @assignments = Assignment.all
  #     end
  #   else
  #     @assignments = Assignment.all
  #   end
  # end
end
