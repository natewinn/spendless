class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

<<<<<<< HEAD
=======
  before_filter :ensure_logged_in

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def ensure_logged_in
    if current_user.nil?
      redirect_to login_path
    end
  end
  
>>>>>>> 23343946d000e3feb575a6bba077a5597c594234
end
