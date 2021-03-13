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
        @assignment = Assignment.find(params[:id])
    end

    def update
        @assignment = Assignment.find(params[:id])
        @assignment.update(assignment_params)
        redirect_to assignment_path(@assignment)
    end

    def destroy

    end

    private

    def assignment_params
        params.require(:assignment).permit(:title, :content, :completed, :letter_grade, :due_date, :teacher_id, :student_id)
    end
end
