class TeachersController < ApplicationController
    def index
        @teachers = current_user.teachers.all
    end
    
    def new
        @teacher = Teacher.new
    end

    def create
        @teacher = current_user.teachers.build(teacher_params)
        if @teacher.save
            redirect_to teacher_path(@teacher)
        else
            render :new
        end 
    end

    def show

    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def teacher_params
        params.require(:teacher).permit(:first_name, :last_name, :subject, :user_id)
    end
end
