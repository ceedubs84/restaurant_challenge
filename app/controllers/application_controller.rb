class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_admin
    @current_admin ||= User.find_by(id: session[:user_id]) if session[:user_id] && current_user.admin
  end
  helper_method :current_admin

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def authenticate_admin!
    unless current_user && current_user.admin
      redirect_to "/"
    end
  end
end
