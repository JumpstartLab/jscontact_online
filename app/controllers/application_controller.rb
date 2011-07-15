class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  def load_resource
    class_name = params[:controller].singularize
    klass = class_name.camelize.constantize
    self.instance_variable_set "@" + class_name, klass.find(params[:id])
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
    
  def login_required
    unless current_user
      redirect_to people_path
    end
  end
end
