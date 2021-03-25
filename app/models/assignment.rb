class Assignment < ApplicationRecord
  belongs_to :teacher
  belongs_to :student

  validates :title, :content, :due_date, presence: true

  
  scope :alpha, -> { order (:content) }  

  scope :overdue_assignments, -> (date = DateTime.now) { where("due_date < ?", date) && where("completed == false") }
  #this is the scope method = usually called in the controller

  # def self.overdue_assignments
  #   Assignment.where('due_date < ? and completed == false', DateTime.now).order(:desc)    
  # end
  
  # def honor_roll ?????

  
  
end
