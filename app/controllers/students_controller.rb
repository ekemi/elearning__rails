class StudentsController < ApplicationController
before_action :authenticate_user!
before_action :set_student, only:[:show,:edit, :update, :destroy]
def index
    @students = current_user.students

end

def show
#find return an exception
#find_by return an nil. Each time we use it, we need to call condition logic( if and else)
#@student = current_user.students.find(params[:id])
set_student
end

def new
    @student = Student.new
end
def create
    #binding.byebug
    #to display a error when the form is displayed, use activerecode validation :display error on the view
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
    params.require(:student).permit(:name,:studentID)#permit the white listed of attributes
end
end