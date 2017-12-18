class GuruController < ApplicationController
  before_action :must_guru_login, only: [:index]
  def login
  end
  def index
  end
  def profil    
  end
  def edit
    @nilai = Santri.all
  end
  def penilaian 
    @nilai = Nilai.all  
    @santri = Santri.all 
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
  def gurubaru
    @guru = Guru.new(guru_params)
      if @guru.save
        flash[:success] = "Data berhasil disimpan"
        redirect_to admin_guru_path
      else
        flash.now[:danger] = "Data yang anda masukkan tidak valid!"
        redirect_to admin_guru_path
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
  def nilaibaru
    @nilai = Nilai.new(nilai_params)
      if @nilai.save
        redirect_to guru_penilaian_path
      else
        flash.now[:danger] = "Gagal menambahkan nilai"
        render 'penilaian'
      end
  end
  private
    def guru_params
      params.permit(:username, :password, :nama, :nip, :jk, :ttl, :alamat, :no_tlp, :mapel, :pendidikan)
    end
    def nilai_params
      params.permit(:nama, :nis, :nisn, :kelas, :thn_ajaran, :mapel, :kkm, :angka, :praktik, :huruf)
    end
end
