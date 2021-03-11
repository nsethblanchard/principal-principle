class StudentsController < ApplicationController
    def index
        @students = current_user.students.all
    end

    def new
        @student = Student.new
    end

    def create
        @student = current_user.students.build(student_params)
        if @student.save
            redirect_to student_path(@student)
        else
            render :new
        end 
    end

    def show
        @student = Student.find(params[:id])
    end

    def edit

    end

    def update

    end

    def destroy
        
    end

    private 

    def student_params
        params.require(:student).permit(:first_name, :last_name, :grade_level, :user_id)
    end
end
