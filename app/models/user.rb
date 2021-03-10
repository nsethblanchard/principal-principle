class User < ApplicationRecord
    has_many :teachers
    has_many :students

    has_secure_password
end
