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
end
