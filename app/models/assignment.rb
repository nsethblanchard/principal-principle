class Assignment < ApplicationRecord
  belongs_to :teacher
  belongs_to :student

  validates :title, :content, :due_date, presence: true

  
  scope :alpha, -> { order (:content) }

    #this is the scope method = usually called in the controller

    # same as def alpha

    # end

  def self.overdue_assignments
    Assignment.where('due_date < ?', DateTime.now).order(:desc)
  end


  
end
