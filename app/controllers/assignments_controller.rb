class AssignmentsController < ApplicationController

    def index

    end

    def new

    end

    def create

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

    def assignment_params
        params.require(:assignment).permit(:title, :content, :completed, :letter_grade, :teacher_id, :student_id)
    end
end
