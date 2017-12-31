class PengasuhanController < ApplicationController
  before_action :must_pengasuhan_login, only: [:index, :raport, :profil, :mail]
  before_action :pengasuhan_sudah_login, only: [:login]
  def login
  end
  def signin
    pengasuhan = Pengasuhan.find_by(username: params[:username])
      if pengasuhan && pengasuhan.authenticate(params[:password])
        session[:pengasuhan_id] = pengasuhan.id
        redirect_to pengasuhan_index_path      
      else
        redirect_to pengasuhan_path, :flash => { :danger => "Username atau Password salah!" }
      end
  end
  def logout
    session[:pengasuhan_id] = nil
    redirect_to pengasuhan_path
  end
  def pengasuhan
    @pengasuhan = Pengasuhan.all
  end
  def pengasuhanbaru
    pengasuhanc = Pengasuhan.find_by_sql("SELECT * FROM pengasuhans WHERE username = '#{params[:username]}'")
    @pengasuhan = Pengasuhan.new(pengasuhan_params)
    if pengasuhanc.count == 0
      if @pengasuhan.save
        @pengasuhan.users.build(username: params[:username], password: params[:password]).save
        redirect_to admin_pengasuhan_path
      else
        flash.now[:danger] = "Data yang anda masukkan tidak valid!"
      end
    else
      redirect_to admin_pengasuhan_path, :flash => { :danger => "Username sudah digunakan!" }
    end
  end
  def hapuspengasuhan
    @pengasuhan = Pengasuhan.find(params[:id])
    @pengasuhan.users.find_by(pengasuhan_id: params[:id]).destroy
    @pengasuhan.destroy
    redirect_to admin_pengasuhan_path
  end
  def update
    @pengasuhan = Pengasuhan.find(session[:pengasuhan_id])
    if @pengasuhan.update(updatepengasuhan_params)
      redirect_to pengasuhan_profil_path, :flash => { :success => "Biodata berhasil diubah!" }
    else
      redirect_to pengasuhan_profil_path, :flash => { :danger => "Biodata gagal diubah!" }
    end
  end
  def mail
    
  end
  def sendd
    m = SmsGateway::Sms.new(number: (params[:notlp]), message: (params[:isisms]), device: '69200')
    if m.deliver
      redirect_to pengasuhan_mail_path, :flash => { :success => "SMS sedang diproses!" }
    else
      redirect_to pengasuhan_mail_path, :flash => { :danger => "Gagal kirim SMS!" }
    end
  end
  def raport
    @tahunajaran = Tahunajaran.first
    @santri = Santri.find_by_sql("SELECT * FROM santris WHERE kelas = '#{params[:kelas]}' AND tahun_ajaran = '#{@tahunajaran.tahun.to_i}'")
    @naik = NaikKela.all
  end
  def newraport
    santri = Santri.find_by(nis: params[:nis])
    tahun = params[:tahun_ajaran].to_i + 1
    if tahun % 2 == 1
      kelas = params[:kelas].to_i + 1
    else
      kelas = params[:kelas]
    end
    naik = NaikKela.new(kenaikan_params)
    naik.kelas = kelas
    naik.tahun_ajaran = tahun
    if naik.save
      santri.update(kelas: kelas, tahun_ajaran: tahun)
      redirect_back(fallback_location: pengasuhan_raport_path)
    else
      redirect_to pengasuhan_raport_path, :flash => { :danger => "Gagal menaikan kelas!" }
    end
  end
  def tinggalkelas
    santri = Santri.find(params[:id])
    tahun = Tahunajaran.first
    tahunbaru = tahun.tahun.to_i + 1
    naik = NaikKela.new(
      nama: santri.nama,
      nis: santri.nis,
      kelas: santri.kelas,
      tahun_ajaran: tahun.tahun.to_i + 1,
      kenaikan: "tidak naik kelas"
      )
    if naik.save
      santri.update(tahun_ajaran: tahunbaru)
      redirect_back(fallback_location: pengasuhan_raport_path)
    else
      redirect_to pengasuhan_raport_path, :flash => { :danger => "Perintah gagal!" }      
    end
  end
  def ubahpassword
    pass = Pengasuhan.find_by(username: params[:username])
    if pass && pass.authenticate(params[:passwordlama])
      pass.users.find_by(username: pass.username).update(password: params[:passwordbaru])
      pass.update(password: params[:passwordbaru])
      redirect_to pengasuhan_profil_path, :flash => { :success => "Berhasil!" }
    else
      redirect_to pengasuhan_profil_path, :flash => { :danger => "Gagal ubah password!" }
    end
  end

  private
    def pengasuhan_params
      params.permit(:username, :password, :nama, :jk, :tempat, :tanggal_lahir, :alamat, :tlp)
    end
    def updatepengasuhan_params
      params.permit(:nama, :jk, :tempat, :tanggal_lahir, :alamat, :tlp)
    end
    def kenaikan_params
      params.permit(:nama, :nis, :kelas, :tahun_ajaran, :kenaikan)
    end
end
