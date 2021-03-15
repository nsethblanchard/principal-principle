class AssignmentsController < ApplicationController

    def index
        #in order to check for nesting, check for foreign key
        if params[:student_id] && @student = Student.find_by_id(params[:id])
            # then it will be nested
            @assignments = @student.assignments
        else
            flash[:message] = "This assignment doesn't exist, redirected to all Assignments" if params[:student_id]
            @assignments = Assignment.all
        end
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
        flash[:message] = "You have updated this Assignment"
        redirect_to assignment_path(@assignment)
    end

    def destroy
        @assignment = Assignment.find(params[:id]).destroy
        redirect_to user_path(current_user)
    end

    private

    def assignment_params
        params.require(:assignment).permit(:title, :content, :completed, :letter_grade, :due_date, :teacher_id, :student_id)
    end
end
