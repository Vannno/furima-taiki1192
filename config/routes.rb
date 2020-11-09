Rails.application.routes.draw do
  devise_for :users 
  get 'furima_taiki1192/index'
  root to: "items#index"
  resources :items, only: [:new, :create]
  
end
