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

  helper_method :current_guru, :guru_logged_in?
  def current_guru
    @current_guru ||= Guru.find(session[:guru_id]) if session[:guru_id]
  end
  def guru_logged_in?
    !!current_guru
  end
  def must_guru_login
    if !guru_logged_in?
      flash[:danger] = "You must login first!"
      redirect_to guru_path
    end
  end

  helper_method :current_santri, :santri_logged_in?
  def current_santri
    @current_santri ||= Santri.find(session[:santri_id]) if session[:santri_id]
  end
  def santri_logged_in?
    !!current_santri
  end
  def must_santri_login
    if !santri_logged_in?
      flash[:danger] = "You must login first!"
      redirect_to santri_path
    end
  end  

  helper_method :current_pengasuhan, :pengasuhan_logged_in?
  def current_pengasuhan
    @current_pengasuhan ||= Pengasuhan.find(session[:pengasuhan_id]) if session[:pengasuhan_id]
  end
  def pengasuhan_logged_in?
    !!current_pengasuhan
  end
  def must_pengasuhan_login
    if pengasuhan_logged_in?
      flash[:danger] = "You must login first!"
      redirect_to pengasuhan_path
    end
  end  
end
