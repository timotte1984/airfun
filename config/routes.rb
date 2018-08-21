Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :attractions, only: [:show, :index, :new, :create, :edit, :update]
  resources :bookings, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
