class UsersController < ApplicationController

  #SignUp
  get '/signup' do
    if logged_in?
      redirect to '/users/current_user.id'
    else
      erb :'users/sign_up'
    end
  end

  post '/signup' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user.nursery_staff = params[:nursery_staff] == "yes"
    if @user.save
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    else
      redirect to '/signup'
    end
  end

  #Login
  get '/login' do
    if logged_in?
      redirect to '/users/current_user.id'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username], email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect to "/users/#{@user.id}"
    else
      redirect to '/signup'
    end
  end

  #Logout
  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

  #Show User
  get '/users/:id' do
    @user = User.find_by_id(params[:id])

    if logged_in?
      if current_user == @user
        erb :'users/show_user'
      else
        erb :failure
      end
    else
      redirect to '/login'
    end
  end
  
end  