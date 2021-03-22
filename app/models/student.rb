class Student < ApplicationRecord 
  belongs_to :user
  has_many :assignments, :dependent => :destroy
  has_many :teachers, through: :assignments, :dependent => :destroy

  #add validation for grade to limit 1-12?
  validates :first_name, :last_name, :fav_movie, presence: true
  validates :grade_level, presence: true, numericality: true

  def full_name
    fn = self.first_name + " " + self.last_name
    fn.titleize
  end
end
