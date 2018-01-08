class SantriController < ApplicationController
  before_action :must_santri_login, only: [:index, :raport, :profil]
  before_action :santri_sudah_login, only: [:login]
  def login
  end
  def signin
  	santri = Santri.find_by(username: params[:username])
      if santri && santri.authenticate(params[:password])
        session[:santri_id] = santri.id
        redirect_to santri_index_path      
      else
        redirect_to santri_path, :flash => { :danger => "Username atau Password salah!" }
      end
  end
  def logout
    session[:santri_id] = nil
    redirect_to santri_path
  end
  def index

  end
  def raport
    santri = current_santri
    tahunajaran = Tahunajaran.first
    @raport = Nilai.find_by_sql("SELECT * FROM nilais WHERE nis = '#{santri.nis}' AND thn_ajaran = '#{params[:thn_ajaran]}'")
    @kelas = Nilai.find_by_sql("SELECT thn_ajaran FROM nilais WHERE nis = '#{santri.nis}' GROUP BY thn_ajaran")
    @kenaikan = NaikKela.find_by_sql("SELECT * FROM naik_kelas WHERE nis = '#{santri.nis}' AND tahun_ajaran = '#{params[:thn_ajaran].to_i}'")
  end
  def profil 
  end
  def santribaru
    santric = Santri.find_by_sql("SELECT * FROM santris WHERE username = '#{params[:username]}'")
    @santri = Santri.new(santri_params)
    @naik = NaikKela.new(naik_params)
    if santric.count == 0
    if @santri.save
      @naik.save
      @santri.users.build(username: params[:username], password: params[:password]).save
      redirect_to admin_santri_path
      else
        flash.now[:danger] = "Data yang anda masukkan tidak valid!"
      end
    else
      redirect_to admin_santri_path, :flash => { :danger => "Username sudah digunakan!" }
    end
  end
  def newsantri
    santric = Santri.find_by_sql("SELECT * FROM santris WHERE username = '#{params[:username]}'")
    @santri = Santri.new(santri_params)
    @naik = NaikKela.new(naik_params)
    if santric.count == 0
     if @santri.save
      @naik.save
      @santri.users.build(username: params[:username], password: params[:password]).save
      redirect_to form_santri_path, :flash => { :success => "Biodata anda berhasil diinput!" }
      else
        flash.now[:danger] = "Data yang anda masukkan tidak valid!"
      end
    else
      redirect_to form_santri_path, :flash => { :danger => "Username sudah digunakan!" }
    end
  end
  def hapussantri
    @santri = Santri.find(params[:id])
    @santri.users.find_by(santri_id: params[:id]).destroy
    @santri.destroy
    redirect_to admin_santri_path
  end
  def update
    @santri = Santri.find(session[:santri_id])
    if @santri.update(updatesantri_params)
      redirect_to santri_profil_path, :flash => { :success => "Biodata berhasil diubah!" }
    else
      redirect_to santri_profil_path, :flash => { :danger => "Biodata gagal diubah!" }
    end
  end
  def ubahpassword
    pass = Santri.find_by(username: params[:username])
    if pass && pass.authenticate(params[:passwordlama])
      pass.users.find_by(username: pass.username).update(password: params[:passwordbaru])
      pass.update(password: params[:passwordbaru])
      redirect_to santri_profil_path, :flash => { :success => "Berhasil!" }
    else
      redirect_to santri_profil_path, :flash => { :error => "Gagal ubah password!" }
    end
  end
  private
    def santri_params
      params.permit(:username, :password, :nama, :nis, :nisn, :jk, :tempat, :tl, :agama, :anak_ke,
                    :status_keluarga, :alamat, :tlp, :kelas, :tahun_masuk, :nama_sekolah, :alamat_sekolah,
                    :nama_ayah, :nama_ibu, :pekerjaan_ayah, :pekerjaan_ibu, :agama_ayah, :agama_ibu, :nama_wali,
                    :agama_wali, :alamat_wali, :tlp_wali, :pekerjaan_wali, :tahun_ajaran)
    end
    def updatesantri_params
      params.permit(:nama, :nis, :nisn, :jk, :tempat, :tl, :agama, :anak_ke,
                    :status_keluarga, :alamat, :tlp, :kelas, :tahun_masuk, :nama_sekolah, :alamat_sekolah,
                    :nama_ayah, :nama_ibu, :pekerjaan_ayah, :pekerjaan_ibu, :agama_ayah, :agama_ibu, :nama_wali,
                    :agama_wali, :alamat_wali, :tlp_wali, :pekerjaan_wali)
    end
    def naik_params
      params.permit(:nama, :nis, :kelas, :tahun_ajaran)
    end
end
