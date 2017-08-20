Rails.application.routes.draw do
  resources :permissions
  resources :rooms
  resources :login_pages
  resources :users
  resources :homes
  resources :speaks
  root 'login_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
