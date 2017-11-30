Rails.application.routes.draw do

  root to: 'home#index'
  
  get "/profil", to: 'home#profil'
  get "/galeri", to: 'home#galeri'
  get "/kontak", to: 'home#kontak'
  get "/info-psb", to: 'home#psb'
  get "/kalender-akademik", to: 'home#kalender'
  get "/kenaikan-kelas", to: 'home#kenaikan'
  get "/kelulusan", to: 'home#kelulusan'
  get "/kmi", to: 'home#kmi'
  get "/mts", to: 'home#mts'
  get "/takhasus", to: 'home#takhasus'
  get "/ma", to: 'home#ma'
  get "/aktivitas", to: 'home#aktivitas'
  get "/fasilitas", to: 'home#fasilitas'
  get "/prestasi", to: 'home#prestasi'

  get "/admin", to: 'admin#login'
  post "/admin", to: 'admin#signin'
  get "/admin/index", to: 'admin#index'
  delete "/admin/logout", to: 'admin#logout'

  get "/santri", to: 'santri#login'
  post "/santri", to: 'santri#signin'

  get "/guru", to: 'guru#login'
  post "/guru", to: 'guru#signin'  
  get "/guru/index", to: 'guru#index'
  delete "/guru/logout", to: 'guru#logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
