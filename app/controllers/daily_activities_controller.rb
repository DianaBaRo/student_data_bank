class DailyActivitiesController < ApplicationController
  #Index
  get '/activities' do
    redirect_if_not_loggedin
    if current_user.nursery_staff
      erb :'activities/activities'
    else
      redirect to '/students'
    end
  end

  #Create
  get '/activities/new' do
    redirect_if_not_loggedin
    if current_user.nursery_staff
      erb :'activities/new_activity'
    else
      redirect to '/students'
    end
  end

  post '/activities' do
    redirect_if_not_loggedin
    if current_user.nursery_staff
      @student = Student.find_by_id(params[:student_id])
      @activity = @student.activities.create(date: params[:date], breakfast: params[:breakfast], morning_snacks: params[:morning_snacks], lunch: params[:lunch], afternoon_snacks: params[:afternoon_snacks], sleep: params[:sleep], nappies: params[:nappies], comments: params[:comments])
      @activity.user = current_user
      if @activity.save
        redirect to "/activities/#{@activity.id}"
      else
        redirect to '/activities/new'
      end
    else
      redirect to '/students'
    end
  end

  #Show Activity
  get '/activities/:id' do
    @activity = Activity.find_by_id(params[:id])
    redirect_if_not_loggedin
    if @activity
      if @activity.student.user == current_user || current_user.nursery_staff
        erb :'activities/show_activity'
      else
        redirect to '/students'
      end
    else
      redirect to '/students'
    end
  end

  #Edit
  get '/activities/:id/edit' do
    redirect_if_not_loggedin
    @activity = Activity.find_by_id(params[:id])
    if current_user.nursery_staff && @activity.user == current_user
      erb :'activities/edit_activity'
    else
      redirect to '/students'
    end
  end

  #Update
  patch '/activities/:id' do
    redirect_if_not_loggedin
    @activity = Activity.find_by_id(params[:id])
    if current_user.nursery_staff && @activity.user == current_user
      if @activity.update(date: params[:date], student_id: params[:student_id], breakfast: params[:breakfast], morning_snacks: params[:morning_snacks], lunch: params[:lunch], afternoon_snacks: params[:afternoon_snacks], sleep: params[:sleep], nappies: params[:nappies], comments: params[:comments])
        redirect to "/activities/#{@activity.id}"
      else
        redirect to "/activities/#{@activity.id}/edit"
      end
    else
      redirect to '/students'
    end
  end

  #Delete
  delete '/activities/:id/delete' do
    redirect_if_not_loggedin
    @activity = Activity.find_by_id(params[:id])
    if @activity && current_user.nursery_staff && @activity.user == current_user
      @activity.delete
      redirect to 'activities'
    else
      redirect to '/students'
    end
  end

end