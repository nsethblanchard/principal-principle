class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update]
    #you can use a before_action for helper methods like "redirect_if_not_logged_in" up here so you don't have to call within each action

    def index
        @students = current_user.students.all
    end

    def new
        @student = Student.new
    end

    def create
        @student = current_user.students.build(student_params)
        if @student.save
            flash[:message]= "You have a new student!"
            redirect_to user_path(@student.user.id)
        else
            # flash[:message] = "Please enter first and last name as well as favorite movie. Grade level is also required and needs to be a number."
            render :new
        end 
    end

    def show
    end

    def edit
    end

    def update
        @student.update(student_params)
        flash[:message] = "You have updated #{full_name(@student)}"
        redirect_to user_path(@student.user.id)
    end

    def destroy
        @student = Student.find(params[:id]).destroy
        redirect_to user_path(current_user)
    end

    private 

    def student_params
        params.require(:student).permit(:first_name, :last_name, :grade_level, :fav_movie, :user_id)
    end

    def set_student
        @student = Student.find(params[:id])
    end
end
