class PeriodsController < ApplicationController

    get '/index' do
        redirect_if_not_logged_in
        @user_periods = current_user.find_periods
        if @user_periods == nil || @user_periods == []
            erb :'periods/no_period'
        else 
            erb :index
        end
    end

    get '/periods/no_period' do
        redirect_if_not_logged_in
        erb :'/periods/no_period'
    end

    get '/periods/create_period' do
        redirect_if_not_logged_in
        erb :'/periods/create_period'
    end

    post '/periods/create_period' do
        redirect_if_not_logged_in
        @period = Period.create(name: params[:period], user_id: session[:user_id])
        redirect to '/index'
    end

    get '/periods/period/:id' do
        redirect_if_not_logged_in
        @students = []
        @period_id = params[:id] #gets period for href
        @period = Period.find_by("id = ?", params[:id])#gets period for .name
        student_id = Student_Period.where("periods_id = ?", @period_id) #finds student associated with period
        student_id.each do |student|
            @students << Student.find_by(id: student.students_id)
        end
        if @students.empty? == true
            erb :'/students/add_student'
        else
            erb :'/periods/period'
        end
        
    end

    delete '/periods/:id' do
        redirect_if_not_logged_in
        @period = Period.find_by("id = ?", params[:id])
        @period_id = params[:id]
        student_id = Student_Period.where("periods_id = ?", @period_id)
        student_id.each do |student|
            Student.find_by(id: student.students_id).delete
        end
        @period = Period.find_by_id(params[:id])
        @period.delete
        redirect to  '/index'
    end

    get '/periods/:id/edit' do
        @period = Period.find_by("id = ?", params[:id])
        erb :'/periods/edit_period'
    end

    patch '/periods/:id/edit' do
        redirect_if_not_logged_in
        @period = Period.find_by_id(params[:id])
        @period.name = params[:name]
        @period.save
        redirect to "/periods/period/#{@period.id}"
    end

    get '/period/:id/add_student' do
        redirect_if_not_logged_in
        @period_id = params[:id]
        erb :'/students/add_student'
    end

    post '/period/:id/add_student' do
        redirect_if_not_logged_in
        @student = Student.create(name: params[:name], birthday: params[:birthday], favorite_color: params[:favorite_color], favorite_food: params[:favorite_food], student_comment: params[:student_comment])
        Student_Period.create(students_id: @student.id, periods_id: params[:id])
        redirect "/periods/period/#{params[:id]}"
    end
    
end