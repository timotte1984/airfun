Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users, only: [:index]
  resources :attractions, only: [:show, :index, :new, :create]
  resources :bookings, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
