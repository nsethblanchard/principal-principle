class AssignmentsController < ApplicationController
    before_action :set_assignment, only: [:show, :edit, :update]
    before_action :redirect_if_not_logged_in

    def index
        #in order to check for nesting, check for foreign key
        if params[:student_id] && @student = Student.find_by_id(params[:student_id]) #add the find_by to return nil if they look for non-existent student
            # then it will be nested
            @assignments = @student.assignments
        else
            @assignments = Assignment.all
        end
    end

    def new
        if params[:teacher_id] && @teacher = Teacher.find_by_id(params[:teacher_id])
            @assignment = @teacher.assignments.build
        else
            #not sure I would need this as functionally, only a teacher can create an assignment
            @assignment = Assignment.new
        end
    end

    def create
        @assignment = Assignment.new(assignment_params)
        if @assignment.save   
            redirect_to assignment_path(@assignment)
        else    
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        @assignment.update(assignment_params)
        flash[:message] = "You have updated this Assignment"
        redirect_to assignment_path(@assignment)
    end

    def destroy
        @assignment = Assignment.find(params[:id]).destroy
        redirect_to user_path(current_user)
    end

    def overdue_assignments
        @assignments = Assignment.overdue_assignments(DateTime.now)
    end

    private

    def assignment_params
        params.require(:assignment).permit(:title, :content, :completed, :letter_grade, :due_date, :teacher_id, :student_id )
    end

    def set_assignment
        @assignment = Assignment.find_by(id: params[:id]) 
        redirect_to user_path(current_user) if !@assignment
    end
end
