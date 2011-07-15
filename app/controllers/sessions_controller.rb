class SessionsController < ApplicationController
  
  def create
    user = User.find_or_create_by_auth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to people_path, :notice => "Welcome!"
  end
  
  def failure
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to people_path, :notice => "You've been logged out!"
  end
end
