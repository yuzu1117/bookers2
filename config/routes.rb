Rails.application.routes.draw do

  devise_for :users
  root to: "home#top"
  get'/home/about' => 'home#about', as: 'about'
  resources :books
  resources :users, only:[:show, :edit, :index, :update]

end
