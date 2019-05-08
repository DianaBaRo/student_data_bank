class DailyActivitiesController < ApplicationController

#Index
get '/activities' do
    if logged_in?
      if current_user.nursery_staff
        erb :'activities/activities'
      else
        redirect to '/users/current_user.id'
      end
    else
      redirect to '/login'
    end
  end

  #Create
  get '/activities/new' do
    if logged_in?
      if current_user.nursery_staff
        erb :'activities/new_activity'
      else
        redirect to '/users/current_user.id'
      end
    else
      redirect to '/login'
    end
  end

  post '/activities' do
    if logged_in?
      if current_user.nursery_staff
        @student = Student.find_by_id(params[:student_id])
        @activity = @student.activities.create(date: params[:date], student_id: params[:student_id], breakfast: params[:breakfast], morning_snacks: params[:morning_snacks], lunch: params[:lunch], afternoon_snacks: params[:afternoon_snacks], sleep: params[:sleep], nappies: params[:nappies], comments: params[:comments])
        @activity.user = @student.user
        if @activity.save
          redirect to "/activities/#{@activity.id}"
        else
          redirect to '/activities/new'
        end
      else
        redirect to '/users/current_user.id'
      end
    else
      redirect to '/login'
    end
  end

  #Show Activity
  get '/activities/:id' do
    @activity = Activity.find_by_id(params[:id])

    if @activity && logged_in?
      if @activity.user == current_user || current_user.nursery_staff
        erb :'activities/show_activity'
      else
        redirect to 'users/current_user.id'
      end
    else
      redirect to '/login'
    end
  end

  #Edit
  get '/activities/:id/edit' do
    if logged_in?
      if current_user.nursery_staff
        @activity = Activity.find_by_id(params[:id])
        erb :'activities/edit_activity'
      else
        redirect to '/users/current_user.id'
      end
    else
      redirect to '/login'
    end
  end

  #Update
  patch '/activities/:id' do
    if logged_in?
      if current_user.nursery_staff
        @student = Student.find_by_id(params[:student_id])
        @activity = Activity.find_by_id(params[:id])
        if @activity.update(date: params[:date], student_id: params[:student_id], breakfast: params[:breakfast], morning_snacks: params[:morning_snacks], lunch: params[:lunch], afternoon_snacks: params[:afternoon_snacks], sleep: params[:sleep], nappies: params[:nappies], comments: params[:comments])
          @activity.user = @student.user
          redirect to "/activities/#{@activity.id}"
        else
          redirect to "/activities/#{@activity.id}/edit"
        end
      else
        redirect to 'users/current_user.id'
      end
    else
      redirect to '/login'
    end
  end

  #Delete
  delete '/activities/:id/delete' do
    if logged_in?
      @activity = Activity.find_by_id(params[:id])
      if @activity && current_user.nursery_staff
        @activity.delete
        redirect to 'activities'
      end
    else
      redirect to '/login'
    end
  end

end