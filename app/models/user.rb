class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    has_secure_password #this takes care of initial password validations but won't do everything for password confirmation field
    
    has_many :teachers
    has_many :students
end
