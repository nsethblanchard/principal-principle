class AssignmentsController < ApplicationController

    def index
        @assignments = Assignment.all
    end

    def new
        @assignment = Assignment.new
    end

    def create
        @assignment = Assignment.new(assignment_params)
        if @assignment.valid?
            
            @assignment.save
            redirect_to assignment_path(@assignment)
        else
            render :new
        end
    end

    def show
        @assignment = Assignment.find(params[:id])
        
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def assignment_params
        params.require(:assignment).permit(:title, :content, :completed, :letter_grade, :teacher_id, :student_id)
    end
end
