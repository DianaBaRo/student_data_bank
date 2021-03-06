class StudentsController < ApplicationController

  #Index
  get '/students' do
    redirect_if_not_loggedin
    if current_user.nursery_staff
      @students = Student.all
    else
      @students = current_user.students
    end
    erb :'students/students'
  end

  #Create
  get '/students/new' do
    if logged_in?
      if current_user.nursery_staff
        erb :'students/new_student'
      else
        redirect to '/students'
      end
    else
      redirect to '/login'
    end
  end

  post '/students' do
    if logged_in?
      if current_user.nursery_staff
        @user = User.find_by_id(params[:user_id])
        @student = @user.students.create(name: params[:name], key_person: params[:key_person], room: params[:room])
        if @student.save
          redirect to "/students/#{@student.id}"
        else
          redirect to '/students/new'
        end
      else
        redirect to '/students'
      end
    else
      redirect to '/login'
    end
  end

  #Show Student
  get '/students/:id' do
    @student = Student.find_by_id(params[:id])

    if @student && logged_in?
      if @student.user == current_user || current_user.nursery_staff
        erb :'students/show_student'
      else
        redirect to '/students'
      end
    else
      redirect to '/login'
    end
  end

  #Edit
  get '/students/:id/edit' do
    if logged_in?
      if current_user.nursery_staff
        @student = Student.find_by_id(params[:id])
        erb :'students/edit_student'
      else
        redirect to '/students'
      end
    else
      redirect to '/login'
    end
  end
 
  #Update
  patch '/students/:id' do
    if logged_in?
      if current_user.nursery_staff
        @student = Student.find_by_id(params[:id])
        if @student.update(name: params[:name], user_id: params[:user_id], key_person: params[:key_person], room: params[:room])
          redirect to "/students/#{@student.id}"
        else
          redirect to "/students/#{@student.id}/edit"
        end
      else
        redirect to '/students'
      end
    else
      redirect to '/login'
    end
  end

  #Delete
  delete '/students/:id/delete' do
    if logged_in?
      @student = Student.find_by_id(params[:id])
      if @student && current_user.nursery_staff
        @student.delete
        redirect to '/students'
      else
        redirect to '/students'
      end
    else
      redirect to '/login'
    end
  end

end