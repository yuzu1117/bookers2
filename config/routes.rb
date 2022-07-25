Rails.application.routes.draw do
  
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  resources :books
  resources :users, only:[:show, :edit, :index]
  
end
