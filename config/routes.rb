Izotorg::Application.routes.draw do
  
  get "home/index"

  devise_for :admins

  devise_for :users

  get "admin", to: "admin/home#index"
  namespace :admin do
    resources :users
    resources :manufacturers
  end

  resources :users


  mount Ckeditor::Engine => '/ckeditor'

  root to: 'users#index'

  resources :manufacturers do
    resources :things
  end

  mount Ckeditor::Engine => "/ckeditor"
end
