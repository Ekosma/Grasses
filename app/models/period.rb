class Period < ActiveRecord::Base
    belongs_to :user  
    has_many :students

    def find_students_by_period
        @students = []
        student_id = Student_Period.where("periods_id = ?", self.id)
        student_id.each do |student|
            @students << Student.find_by(id: student.students_id)
        end
        return @students
    end
end