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
  def pengasuhan
    @pengasuhan = Pengasuhan.all
  end
  def pengasuhanbaru
    @pengasuhan = Pengasuhan.new(pengasuhan_params)
      if @pengasuhan.save
        redirect_to admin_pengasuhan_path
      else
        flash.now[:danger] = "Data yang anda masukkan tidak valid!"
      end
  end
  def hapuspengasuhan
    @pengasuhan = Pengasuhan.find(params[:id])
    @pengasuhan.destroy
    redirect_to admin_pengasuhan_path
  end
  def update
    @pengasuhan = Pengasuhan.find(session[:pengasuhan_id])
    if @pengasuhan.update(pengasuhan_params)
      flash[:success] = "Biodata berhasil diubah"
      redirect_to pengasuhan_profil_path
    else
      flash[:danger] = "Biodata gagal diubah!"
      redirect_to pengasuhan_profil_path
    end
  end
  def mail
    
  end
  def sendd
    m = SmsGateway::Sms.new(number: (params[:notlp]), message: (params[:isisms]), device: '69200')
    if m.deliver
      flash[:success] = "Sms sedang diproses"
      redirect_to pengasuhan_mail_path
    else
      flash.now[:danger] = "Gagal!"
      render 'mail'
    end
  end

  private
    def pengasuhan_params
      params.permit(:username, :password, :nama, :jk, :tempat, :tanggal_lahir, :alamat, :tlp)
    end
end
