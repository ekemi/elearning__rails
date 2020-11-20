class Student < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :students, through: :reviews
  validates :name,:studentID,  presence: true, uniqueness: {scope: :user_id}
end

#reload! => reload! the console.
#first_or_create
#find_or_create