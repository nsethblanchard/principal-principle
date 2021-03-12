class Assignment < ApplicationRecord
  belongs_to :teacher
  belongs_to :student


  # def teacher_name=(first_name, last_name)
  #   self.teacher = Teacher.find_by(first_name: first_name, last_name: last_name)
  # end

  # def teacher_name
  #    self.teacher ? self.teacher.name : nil
  # end
end
