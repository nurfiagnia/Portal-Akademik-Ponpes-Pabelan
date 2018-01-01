class HomeController < ApplicationController
  def index
  end
  def profil
    
  end
  def galeri
  end
  def kontak
  	@kontak = Kontak.all
  end
  def psb
  	
  end
  def kalender
  	
  end
  def kenaikan
    @tahunajaran = Tahunajaran.first
  	@rankings = Nilai.find_by_sql("SELECT nama,nis,AVG(angka) AS angka FROM nilais WHERE kelas = '#{params["kelas"]}' AND thn_ajaran = '#{@tahunajaran.tahun}' GROUP BY nis ORDER BY angka DESC")
  end
  def kelulusan
  	
  end
  def kmi
    
  end
  def mts
    
  end
  def takhasus
    
  end
  def ma
    
  end
  def aktivitas
    
  end
  def fasilitas
    
  end
  def prestasi
    
  end
  def formsantri
    @tahunajaran = Tahunajaran.first
  end
end

