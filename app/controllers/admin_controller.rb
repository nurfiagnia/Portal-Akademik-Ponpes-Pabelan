class AdminController < ApplicationController
  before_action :must_admin_login, only: [:index, :guru, :santri, :pengaturan, :kontak, :files]
  before_action :admin_sudah_login, only: [:login]
  def login
  end
  def kontak
    @kontak = Kontak.last
  end
  def files
    
  end
  def setfiles
    @filea = File.new(nama: params[:namaa], attachment: params[:attachmenta].to_s)
    @fileb = File.new(nama: params[:namaab], attachment: params[:attachmentb].to_s)
    if @filea.save && @fileb.save
      redirect_back(fallback_location: admin_files_path)
    end
    #File.find_by(nama: params[:namaa]).update(attachment: params[:attachmenta])
    #File.find_by(nama: params[:namab]).update(attachment: params[:attachmentb])
  end
  def setkontak
    @kontak = Kontak.first
    if @kontak.update(params.permit(:email, :tlp, :pengasuhan, :kmi, :ma, :sikpb))
      redirect_to admin_kontak_path
    else
      redirect_to admin_kontak_path, :flash => { :danger => "Error :(" }
    end
  end
  def signin
    admin = Admin.find_by(username: params[:username])
  		if admin && admin.authenticate(params[:password])
        session[:admin_id] = admin.id
        redirect_to admin_index_path      
  		else
        redirect_to admin_path, :flash => { :danger => "Username atau Password salah!" }
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
      @santri = Santri.find_by_sql("SELECT * FROM santris WHERE jk = 'Pria' AND kelas = '#{params[:kelas]}'")
      @santriwati = Santri.find_by_sql("SELECT * FROM santris WHERE jk = 'Wanita' AND kelas = '#{params[:kelas]}'")
      @tahunajaran = Tahunajaran.first
  end 
  def pengasuhan
     @pengasuhanputra = Pengasuhan.find_by_sql("SELECT * FROM pengasuhans WHERE jk = 'Pria'")
     @pengasuhanputri = Pengasuhan.find_by_sql("SELECT * FROM pengasuhans WHERE jk = 'Wanita'")
  end 
  def pengaturan
    @tahunajaran = Tahunajaran.first
  end
  def setpengaturan
    @tahunajaran = Tahunajaran.first
    if @tahunajaran.update(tahun: params[:tahunajaran])
      redirect_to admin_tahun_ajaran_path
    else
      redirect_to admin_tahun_ajaran_path, :flash => { :danger => "Error :(" }
    end
  end
end