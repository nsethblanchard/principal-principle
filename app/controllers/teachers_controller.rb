class TeachersController < ApplicationController
    before_action :set_teacher, only: [:show, :edit, :update]
    before_action :redirect_if_not_logged_in
    

    def index
        @teachers = current_user.teachers
        if params[:search] && !params[:search].empty?
            @teachers = Teacher.search(params[:search])
        else
            @teachers = current_user.teachers   
        end
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
    end

    def update
        @teacher.update(teacher_params)
        flash[:message] = "You have updated #{full_name(@teacher)}"
        redirect_to user_path(@teacher.user.id)
    end

    def destroy
        @teacher = Teacher.find(params[:id]).destroy
        redirect_to user_path(current_user)
    end

    private

    def teacher_params
        params.require(:teacher).permit(:first_name, :last_name, :subject, :hobby, :user_id, :search)
    end

    def set_teacher
        @teacher = Teacher.find_by(id: params[:id]) 
        redirect_to user_path(current_user) if !@teacher
    end
end
