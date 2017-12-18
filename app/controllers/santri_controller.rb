class SantriController < ApplicationController
  def login
  end
  def signin
  	santri = Santri.find_by(username: params[:username])
      if santri && santri.authenticate(params[:password])
        session[:santri_id] = santri.id
        redirect_to santri_index_path      
      else
        flash.now[:danger] = "Username atau Password salah!"
        render 'login'
      end
  end
  def logout
    session[:santri_id] = nil
    redirect_to santri_path
  end
  def index

  end
  def raport
    @raport = Nilai.all
  end
  def profil 
  end
  def santribaru
    @santri = Santri.new(santri_params)
    if @santri.save
      redirect_to admin_santri_path
      else
        flash.now[:danger] = "Data yang anda masukkan tidak valid!"
      end
  end
  def hapussantri
    @santri = Santri.find(params[:id])
    @santri.destroy
    redirect_to admin_santri_path
  end
  def update
    @santri = Santri.find(session[:santri_id])
    if @santri.update(santri_params)
      flash[:success] = "Biodata berhasil diubah"
      redirect_to santri_profil_path
    else
      flash[:danger] = "Biodata gagal diubah!"
      redirect_to santri_profil_path
    end
  end
  private
    def santri_params
      params.permit(:username, :password, :nama, :nis, :nisn, :jk, :tempat, :tl, :agama, :anak_ke,
                    :status_keluarga, :alamat, :tlp, :kelas, :tahun_masuk, :nama_sekolah, :alamat_sekolah,
                    :nama_ayah, :nama_ibu, :pekerjaan_ayah, :pekerjaan_ibu, :agama_ayah, :agama_ibu, :nama_wali,
                    :agama_wali, :alamat_wali, :tlp_wali, :pekerjaan_wali)
    end
end
