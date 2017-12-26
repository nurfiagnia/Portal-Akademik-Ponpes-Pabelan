class PengasuhanController < ApplicationController
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
    @pengasuhan = Pengasuhan.new(pengasuhan_params)
      if @pengasuhan.save
        @pengasuhan.users.build(username: params[:username], password: params[:password]).save
        redirect_to admin_pengasuhan_path
      else
        flash.now[:danger] = "Data yang anda masukkan tidak valid!"
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
    if @pengasuhan.update(pengasuhan_params)
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

  private
    def pengasuhan_params
      params.permit(:username, :password, :nama, :jk, :tempat, :tanggal_lahir, :alamat, :tlp)
    end
end
