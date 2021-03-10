module TeachersHelper

    def full_name
        @teacher.first_name + " " + @teacher.last_name
    end
end
