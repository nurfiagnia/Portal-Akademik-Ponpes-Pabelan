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

  private
    def pengasuhan_params
      params.permit(:username, :password, :nama, :jk, :ttl, :alamat, :no_tlp)
    end
end
