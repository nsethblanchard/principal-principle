class TeachersController < ApplicationController
    def index

    end
    
    def new
        @teacher = Teacher.new
    end

    def create
        @teacher = Teacher.new(teacher_params)

        #build out later
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
