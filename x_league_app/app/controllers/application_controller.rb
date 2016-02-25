class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def authorize
      redirect_to login_path, alert: 'Not authorized - you must be logged in!' if current_user.nil?
  end

  def admin_authorize
      redirect_to login_path, alert: 'Not authorized - you must be an admin!' unless current_user && current_user.admin
  end

  private
    helper_method :current_user

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
