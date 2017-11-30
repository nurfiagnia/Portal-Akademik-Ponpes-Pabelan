class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_admin, :admin_logged_in?
  def current_admin
  	@current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  def admin_logged_in?
  	!!current_admin
  end
  def must_admin_login
  	if !admin_logged_in?
  		flash[:danger] = "You must login first!"
  		redirect_to admin_path
  	end
  end
end
