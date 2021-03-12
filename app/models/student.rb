class Student < ApplicationRecord 
  belongs_to :user
  has_many :assignments
  has_many :teachers, through: :assignments

  #add validation for grade to limit 1-12?
end
