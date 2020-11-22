class Review < ApplicationRecord
  belongs_to :student
  belongs_to :course
  validates :rating, :comments ,presence: true
  

  def pro_name
    self.course.profesor_name
  end
  def student_ID
    self.student.studentID
  end
  

end