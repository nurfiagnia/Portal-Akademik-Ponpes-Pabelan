class GuruController < ApplicationController
  before_action :must_guru_login, only: [:index, :penilaian, :profil]
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
    guru = current_guru
    @tahunajaran = Tahunajaran.first
    @nilai = Nilai.find_by_sql("SELECT * FROM nilais WHERE mapel = '#{guru.mapel}' AND kelas = '#{params[:kelas]}' AND thn_ajaran = '#{@tahunajaran.tahun}'") 
    @santri = Santri.find_by_sql("SELECT * FROM santris WHERE kelas = '#{params[:kelas]}'")
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
        @guru.users.build(username: params[:username], password: params[:password]).save
        flash[:success] = "Data berhasil disimpan"
        redirect_to admin_guru_path
      else
        flash.now[:danger] = "Data yang anda masukkan tidak valid!"
        redirect_to admin_guru_path
      end
  end
  def hapusguru
    @guru = Guru.find(params[:id])
    @guru.users.find_by(guru_id: params[:id]).destroy
    @guru.destroy
    redirect_to admin_guru_path
  end
  def update
    @guru = Guru.find(session[:guru_id])
    if @guru.update(updateguru_params)
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
        redirect_back(fallback_location: guru_penilaian_path)
      else
        flash.now[:danger] = "Gagal menambahkan nilai"
        render 'penilaian'
      end
  end
  def updatenilai
    @nilai = Nilai.find(params[:id])
    if @nilai.update(nilai_params)
        redirect_back(fallback_location: guru_penilaian_path)
      else
        flash.now[:danger] = "Gagal merubah nilai"
        render 'penilaian'
      end
  end
  def hapusnilai
    @nilai = Nilai.find(params[:id])
    if @nilai.destroy
        redirect_back(fallback_location: guru_penilaian_path)
      else
        flash.now[:danger] = "Gagal hapus nilai"
        render 'penilaian'
      end
  end
  def ubahpassword
    pass = Guru.find_by(username: params[:username])
    if pass && pass.authenticate(params[:passwordlama])
      pass.users.find_by(username: pass.username).update(password: params[:passwordbaru])
      pass.update(password: params[:passwordbaru])
      redirect_to guru_profil_path, :flash => { :success => "Berhasil!" }
    else
      redirect_to guru_profil_path, :flash => { :danger => "Gagal ubah password!" }
    end
  end
  private
    def guru_params
      params.permit(:username, :password, :nama, :nip, :jk, :ttl, :alamat, :no_tlp, :mapel, :pendidikan)
    end
    def updateguru_params
      params.permit(:nama, :nip, :jk, :ttl, :alamat, :no_tlp, :mapel, :pendidikan)
    end
    def nilai_params
      params.permit(:nama, :nis, :nisn, :kelas, :thn_ajaran, :mapel, :kkm, :angka, :praktik, :huruf)
    end
end
