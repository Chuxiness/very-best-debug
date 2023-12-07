class UsersController < ApplicationController

  def index
    matching_users = User.all
    @users = matching_users.order({:created_at => :asc})

    render({ :template => "user_templates/all_users"})
  end
  
  def show
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.at(0)

    render({ :template => "user_templates/user_details"})
  end
  
  def create
    user = User.new
    user.username = params.fetch("query_username")
    user.save
    redirect_to("/users/"+user.id.to_s)
  end
  
  def update
    user_name = params.fetch("username")
    matching_users = User.where({ :id => user_name })
    the_user = matching_users.at(0)
    
    the_user.username = params.fetch("query_username")
    the_user.save
    @user=the_user
    render({ :template => "user_templates/user_details"})
    #redirect_to("/users/"+the_user.username.to_s)
  end

end
