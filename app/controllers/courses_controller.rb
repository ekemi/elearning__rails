class CoursesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_course, only:[:show,:edit, :update, :destroy]



def po 
    @courses = Course.all
end
def index
    @querry = params[:search]
    if params[:search].blank?
        redirect_to(root_path, alert: "Empty field!")
    elsif
        @results = Course.search(params[:search]) 
    else
        @results = Course.all.beta  
        redirect_to(root_path, alert: "Not find")
    end
end   


def show
end

def new
  @course = Course.new
end

def create
   @course = Course.new(course_params)
   if @course.save
    redirect_to course_path(@course)
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
    params.require(:course).permit(:course_name,:profesor_name,:length,:number_videos, :search)
end
end
