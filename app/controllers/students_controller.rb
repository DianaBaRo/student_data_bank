class StudentsController < ApplicationController
  #Index
  get '/students' do
    if logged_in?
      @students = Student.all

      erb :'students/students'
    else
      redirect to '/login'
    end
  end

  #Create
  get '/students/new' do
    if logged_in?
      erb :'students/new_student'
    else
      redirect to '/login'
    end
  end

end