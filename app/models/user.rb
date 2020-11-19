class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :students
  has_many :courses, through: :students
  has_many :reviews, through: :students

  
  s
  devise :database_authenticatable, :registerable,#sing up and log in
         :recoverable, :rememberable, :validatable # optional
end
