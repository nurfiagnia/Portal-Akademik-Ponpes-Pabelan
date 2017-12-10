class GuruController < ApplicationController
  before_action :must_guru_login, only: [:index]
  def login
  end
  def index
  end
  def profil    
  end
  def penilaian 
    @nilai = Nilai.all   
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

  def guru
    @guru = Guru.all
  end
  def gurubaru
    @guru = Guru.new(guru_params)
      if @guru.save
        redirect_to admin_guru_path
      else
        flash.now[:danger] = "Data yang anda masukkan tidak valid!"
      end
  end
  def hapusguru
    @guru = Guru.find(params[:id])
    @guru.destroy
    redirect_to admin_guru_path
  end
  def update
    @guru = Guru.find(session[:guru_id])
    if @guru.update(guru_params)
      flash[:success] = "Biodata berhasil diubah"
      redirect_to guru_profil_path
    else
      flash[:danger] = "Biodata gagal diubah!"
      redirect_to guru_profil_path
    end
  end

  private
    def guru_params
      params.permit(:username, :password, :nama, :nip, :jk, :ttl, :alamat, :no_tlp, :mapel, :pendidikan)
    end
end
