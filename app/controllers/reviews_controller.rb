class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_review, only:[:show,:edit, :update, :destroy]

    def index
        @student = current_user.students.find_by_id(params[:student_id])
        if @student
        @reviews = @student.reviews
        else
          @reviews = current_user.reviews
        end
    
    end

    def show
    end

    def new
        @student = current_user.students.find_by_id(params[:student_id])
        @course = Course.find_by_id(params[:course_id])
        if @student
            @review =@student.reviews.build 

        elsif @doctor
            @review =@course.reviews.build
        else    

        @review = Review.new
    end
end

def create
    @review = Review.new(review_params)
    if @review.save
        redirect_to review_path(@review)

    else
      render :new  
    end
end

    def edit

    end

    def update
        if @review.update(review_params)
           redirect_to review_path(@review)
       else
        render :edit
       end
    end

    def destroy
        @review.destroy
        redirect_to reviews_path
    end
private

def set_review
    @review = current_user.reviews.find(params[:id])   
end
def review_params
    params.require(:review).permit(:rating, :comments,:course_id, :student_id)
end
end
