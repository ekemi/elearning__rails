class Course < ApplicationRecord
    has_many :reviews
    has_many :students, through: :reviews

    validates :course_name, :profesor_name,:length,:number_videos, presence: true
end
