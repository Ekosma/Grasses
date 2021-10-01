class User < ActiveRecord::Base
    has_secure_password
    has_many :periods    
    has_many :students, through: :periods
    
    def find_periods
        @periods = Period.where("user_id = ?", self.id) 
        return @periods
    end

    def find_students
        @students = Student.where("id = ?", self.id) 
        return @students
    end
end
