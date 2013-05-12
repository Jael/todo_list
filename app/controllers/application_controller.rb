class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.nil?
      redirect_to :login, alert: "Please login or sign up"
    else
      redirect_to todo_tasks_path, alert: "Access denied!"
    end
  end


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
