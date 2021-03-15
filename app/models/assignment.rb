class Assignment < ApplicationRecord
  belongs_to :teacher
  belongs_to :student

  
  scope :alpha, -> { order (:content) }
    #this is the scope method = usually called in the controller

    # same as def grades

    # end
  
end
