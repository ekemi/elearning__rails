class Course < ApplicationRecord
    has_many :reviews
    has_many :students, through: :reviews

    validates :course_name, :profesor_name,:length,:number_videos, presence: true

scope :beta,->{order('LOWER(course_name)')} 
def self.search (course_name)
    Course.where("course_name LIKE ?", "%#{course_name}%").beta

    
end

def self.not_found_db
    puts "no record"
end
end