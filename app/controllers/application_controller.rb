class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
rescue_from ActiveRecord::RecordNotFound, :with => :page_not_found

def page_not_found
    flash[:message]="Page not found"
    redirect_to root_path #message: "Page not found"
end
protected


def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:phone_number])
end 
end
