class CoursesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_course, only:[:show,:edit, :update, :destroy]




def index
    @courses = Course.all
end
def show
end

def new
  @course = Course.new
end

def create
   @course = Course.new(doctor_params)
   if @course.save
    redirect_to course_path(@couse)
   else
    render :new
   end
end

def edit
end

def update
     
end

def destroy 
end
private 

def set_course
   @course =Course.find(params[:id])
end

def course_params
    params.require(:course).permit(:course_name,:profesor_name,:length,:number_videos)
end
end
