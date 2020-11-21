Rails.application.routes.draw do
  resources :reviews
  resources :courses
  resources :courses do
    resources :reviews, only: [:index,:new]
  end
  resources :students do 
    resources :courses, only: [:index]#1
    resources :reviews, only: [:new, :index]#2


  end



  #1/patients/:patient_id/doctors
  #1/patients/:patient_id/appointements
  #2/patients/patient_id/appointemnt/new
  devise_for :users
  root 'students#index'#devise require a root route
  get'/pos/', to: 'courses#po'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
