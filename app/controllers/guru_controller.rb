class GuruController < ApplicationController
  before_action :must_guru_login, only: [:index]
  def login
  end
  def index
  end
  def signin
    guru = Guru.find_by(username: params[:username])
    if guru && guru.authenticate(params[:password])
      session[:guru_id] = guru.id
      redirect_to guru_index_path
    else
      flash.now[:danger] = "Username atau Password salah!"
      render 'login'
    end
  end
  def logout
    session[:guru_id] = nil
    redirect_to guru_path
  end
end
