Rails.application.routes.draw do
  get 'admin/index'

  root to: 'home#index'
  get "/profil", to: 'home#profil'
  get "/galeri", to: 'home#galeri'
  get "/kontak", to: 'home#kontak'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
