class User < ApplicationRecord
    validates :username, uniqueness: true, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    
    has_secure_password #this takes care of initial password validations but won't do everything for password confirmation field
    
    has_many :teachers
    has_many :students

    def self.from_omniauth(auth)
      where(uid: auth.info.uid).first do |user|
        #removed "_or_initialize" so a new user wouldn't be instantiated
        user.username = auth.info.name
        user.email = auth.info.email
        user.password = SecureRandom.hex
      end
    end


end
