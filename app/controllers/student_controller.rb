class StudentController < ApplicationController

    get '/students/:id' do
        redirect_if_not_logged_in
        @student_id = params[:id]
        @stud_att = []
        @student = Student.where("id = ?", @student_id)
        @student.each do |attribute|
            @stud_att << attribute
        end
        @student_name = Student.find_by("id = ?", @student_id)
        erb :'/students/student'
    end

    delete '/students/:id' do
        redirect_if_not_logged_in
        #@student_id = params[:id]
        #@student_id.each do |student|
            #Student.find_by(id: student.students_id).delete
        #end
        @student_id = params[:id]
        @student = Student.find_by_id(params[:id])
        @student.delete
        redirect to '/index'
    end

    get '/students/:id/edit' do
        @student = Student.find_by("id = ?", params[:id])
        erb :'/students/edit_student'
    end

    patch '/students/:id/edit' do
        redirect_if_not_logged_in
        @student = Student.find_by_id(params[:id])
        @student.name = params[:name]
        @student.birthday = params[:birthday]
        @student.favorite_color = params[:favorite_color]
        @student.favorite_food = params[:favorite_food]
        @student.student_comment = params[:student_comment]
        @student.save
        redirect to "/students/student/#{@student.id}"
    end

end