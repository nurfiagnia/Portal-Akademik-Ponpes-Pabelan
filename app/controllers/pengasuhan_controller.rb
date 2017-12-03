class PengasuhanController < ApplicationController
  def login
  end
  def signin
    pengasuhan = Pengasuhan.find_by(username: params[:username])
      if pengasuhan && pengasuhan.authenticate(params[:password])
        session[:pengasuhan_id] = pengasuhan.id
        redirect_to pengasuhan_index_path      
      else
        flash.now[:danger] = "Username atau Password salah!"
        render 'login'
      end
  end
  def logout
    session[:pengasuhan_id] = nil
    redirect_to pengasuhan_path
  end
end
