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
            flash[:message]= "You have a new student!"
            redirect_to user_path(@student.user.id)
        else
            render :new
        end 
    end

    def show
        @student = Student.find_by(id: params[:id])
        redirect_to '/' if !@student.user 


        # if you only use @student = Student.find(params[:id]), you would need a rescue statement
        # because if it returns nil, there will be an error and the program will break
    end

    def edit
        @student = Student.find(params[:id])
    end

    def update
        @student = Student.find(params[:id])
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
end
