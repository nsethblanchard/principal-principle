class Teacher < ApplicationRecord
  belongs_to :user
  has_many :assignments
  has_many :students, through: :assignments

  validates :first_name, :last_name, :subject, :hobby, presence: true
end
