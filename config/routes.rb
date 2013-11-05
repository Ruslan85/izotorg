Izotorg::Application.routes.draw do
  
  devise_for :users

  resources :users


  mount Ckeditor::Engine => '/ckeditor'

  root to: 'manufacturers#index'

  resources :manufacturers do
    resources :things
  end

  mount Ckeditor::Engine => "/ckeditor"
end
