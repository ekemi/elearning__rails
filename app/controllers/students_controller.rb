class StudentsController < ApplicationController
before_action :authenticate_user!
before_action :set_student, only:[:show,:edit, :update, :destroy]
def index
    @students = current_user.students

end

def show

set_student
end

def new
    @student = Student.new
end
def create
    @student =current_user.students.build(student_params)
    if @student.save
        redirect_to student_path(@student) 
    else

        render :new
    end 
end

def edit
end
def update
    if @student.update(student_params)
       redirect_to student_path(@student)
   else
    render :edit
   end
end
def destroy
    @student.destroy
    redirect_to students_path
end

private
def set_student
    @student = current_user.students.find(params[:id]) 
end

def student_params#strong_params
    params.require(:student).permit(:name,:studentID)
end
end