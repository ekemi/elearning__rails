class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :students
  has_many :courses, through: :students
  has_many :reviews, through: :students

  

  devise :database_authenticatable, :registerable,#sing up and log in
         :recoverable, :rememberable, :validatable,  :omniauthable, omniauth_providers: [:google_oauth2] # optional

         def self.fromGoogle(email:, full_name:, uid:, avatar_url:)
          create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
        
      
         end
end
