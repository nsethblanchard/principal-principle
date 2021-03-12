class AssignmentsController < ApplicationController

    def index

    end

    def new
        @assignment = Assignment.new
    end

    def create
        @assignment = Assignment.create(assignment_params)
        if @assignment.save
            redirect_to assignment_path(@assignment)
        else
            raise params
        end
    end

    def show
        @assigment = Assignment.find(params[:id])
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
