class TeachersController < ApplicationController
    #you can use a before_action for helper methods like "redirect_if_not_logged_in" up here so you don't have to call within each action

    def index
        @teachers = current_user.teachers.all
    end
    
    def new
        @teacher = Teacher.new
    end

    def create
        @teacher = current_user.teachers.build(teacher_params)
        if @teacher.save
            flash[:message]= "You have a new teacher!"
            redirect_to user_path(@teacher.user.id)
        else
            render :new
        end 
    end

    def show

    end

    def edit
        @teacher = Teacher.find(params[:id])
    end

    def update
        @teacher = Teacher.find(params[:id])
        @teacher.update(teacher_params)
        flash[:message] = "You have updated #{full_name(@teacher)}"
        redirect_to user_path(@teacher.user.id)
    end

    def destroy

    end

    private

    def teacher_params
        params.require(:teacher).permit(:first_name, :last_name, :subject, :user_id)
    end
end
