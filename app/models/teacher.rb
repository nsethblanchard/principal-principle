class Teacher < ApplicationRecord
  belongs_to :user
  has_many :assignments, :dependent => :destroy
  has_many :students, through: :assignments, :dependent => :destroy

  validates :first_name, :last_name, :subject, :hobby, presence: true

  def full_name
    fn = self.first_name + " " + self.last_name
    fn.titleize
  end
end
