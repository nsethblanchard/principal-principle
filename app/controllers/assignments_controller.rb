class AssignmentsController < ApplicationController
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
        if @assignment.valid?
            @assignment.save
            redirect_to assignment_path(@assignment)
        else
            flash[:message] = "Title, Content, and due date are requirements.  Please don't leave them blank."
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

    def alpha  #practice and not implemented as a view or link on site
        @assignments = Assignment.all.alpha
    end

    def overdue_assignments
        @assignments = Assignment.overdue_assignments
    end

    private

    def assignment_params
        params.require(:assignment).permit(:title, :content, :completed, :letter_grade, :due_date, :teacher_id, :student_id)
    end
end
