class TeachersController < ApplicationController
    def new
        @teacher = Teacher.new
    end

    def create
        @teacher = Teacher.new(teacher_params)

        #build out later
    end

    private

    def teacher_params
        params.require(:teacher).permit(:first_name, :last_name, :subject, :user_id)
    end
end
