class Review < ApplicationRecord
  belongs_to :student
  belongs_to :course
  validates :rating, :comments ,presence: true
  validates :prohibeted_words , :filter_words
  
  #we call error_messages on the object if the object does not save in the db=>Object.error.full_messages
  #belongs on rails 5+ add add presence validation for the foreign key 
  #course and student validation should be add it by belongs to

  #custom validation
private
  def prohibeted_words
      words = ["Fucked","Nasty", "Ugly","Fat"]
  end 
def filter_words

  prohibeted_words.each do |t|
    if comments == t 
      errors.add(:comments, "Prohibeted word")
    end
  end
end


end


end

# user = User.first_or_create(email: "pierre@yahoo.com", password: "surya1986", phone_numer: "(202)734-7754")#seed
# st1 = user.students.find_or_create_by(name: "Patrick")
# st2 = user.students.find_or_create_by(name: "Marie", studentID: 13)
# cr1= Course.find_or_create_by(course_name: "Biology", profesor_name: "Dr. Abro", length:"20 hours", number_videos: 19)
# cr2= Course.find_or_create_by(course_name: "Chemistry", profesor_name: "Mr. Rabio", length:"15 hours", number_videos: 1
# r1 =cr1.reviews.find_or_create_by(rating: 70,
# student: st1, comments: "Very good")

# 10.times do
#   course =[cr1,cr2].sample
#   r = [100, 40, 90,20].sample
#   c=["Poor","Bad","Very good"].sample
#   course.reviews.find_or_create_by(rating: r,
#   comments: c, student: [st1,st2].sample)  
