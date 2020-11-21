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
  #we call error_messages on the object if the object does not save in the db=>Object.error.full_messages
  #belongs on rails 5+ add add presence validation for the foreign key 
  #course and student validation should be add it by belongs to

  #custom validation

end