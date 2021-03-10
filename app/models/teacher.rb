class Teacher < ApplicationRecord
  belongs_to :user
  has_many :assignments
  has_many :students, through: :assignments
end
