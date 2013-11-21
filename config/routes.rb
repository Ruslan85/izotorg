Izotorg::Application.routes.draw do

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

  resources :manufacturers, only: [ :index, :show ] do
    resources :products, only: [ :index, :show ]
  end

  resource :static_pages, only: [] do
    ["index", "about", "products", "articles", "partners", "price", "contacts"].each do |static_page|
      get static_page
    end
  end

  root to: 'users#index'
end
