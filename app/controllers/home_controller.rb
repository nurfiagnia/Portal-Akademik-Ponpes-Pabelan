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
  	
  end
  def kelulusan
  	
  end
end
