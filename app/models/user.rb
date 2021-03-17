class User < ApplicationRecord
    validates :username, uniqueness: true, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    
    has_secure_password #this takes care of initial password validations but won't do everything for password confirmation field
    
    has_many :teachers
    has_many :students

    def self.from_omniauth(auth)
      where(uid: auth.info.uid).first_or_initialize do |user|
        user.username = auth.info.name
        user.email = auth.info.email
        user.school = auth.info.school
        user.password = SecureRandom.hex
      end
    end

    # def self.from_omniauth(auth)
    #     first_or_create(uid: auth.uid) do |user|
    #     user.username = auth.info.name
    #     user.email = auth.info.email
    #     user.school = auth.info.school
    #     user.password = SecureRandom.hex
    #   end
    # end
end
