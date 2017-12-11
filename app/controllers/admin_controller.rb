class AdminController < ApplicationController
  before_action :must_admin_login, only: [:index, :guru, :santri]
  def login
  end
  def signin
    admin = Admin.find_by(username: params[:username])
  		if admin && admin.authenticate(params[:password])
        session[:admin_id] = admin.id
        redirect_to admin_index_path      
  		else
        flash.now[:danger] = "Username atau Password salah!"
        render 'login'
  		end
  end
  def logout
    session[:admin_id] = nil
    redirect_to admin_path
  end
  def guru
      @gurus = Guru.find_by_sql("SELECT * FROM gurus WHERE pendidikan = 'MTs'")
      @gurut = Guru.find_by_sql("SELECT * FROM gurus WHERE pendidikan = 'Takhasus'")
      @guru = Guru.find_by_sql("SELECT * FROM gurus WHERE pendidikan = 'MA'")
  end
  def santri
      @santri = Santri.find_by_sql("SELECT * FROM santris WHERE jk = 'Pria'")
      @santriwati = Santri.find_by_sql("SELECT * FROM santris WHERE jk = 'Wanita'")
  end 
  def pengasuhan
     @pengasuhanputra = Pengasuhan.find_by_sql("SELECT * FROM pengasuhans WHERE jk = 'Pria'")
     @pengasuhanputri = Pengasuhan.find_by_sql("SELECT * FROM pengasuhans WHERE jk = 'Wanita'")
  end 
  def pengaturan
    
  end
end