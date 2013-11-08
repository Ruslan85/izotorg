Izotorg::Application.routes.draw do
  
  get "home/index"

  devise_for :admins

  devise_for :users

  get "admin", to: "admin/home#index"
  namespace :admin do
    resources :users
    resources :manufacturers
    resources :products
  end

  resources :users


  mount Ckeditor::Engine => '/ckeditor'

  root to: 'users#index'

  resources :manufacturers, only: [ :index, :show ] do
    resources :products, only: [ :index, :show ]
  end

  mount Ckeditor::Engine => "/ckeditor"
end
