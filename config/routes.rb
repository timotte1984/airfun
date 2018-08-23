Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: 'pages#home'
  resources :attractions, only: [:show, :index, :new, :create, :edit, :update, :destroy] do
    resources :availability
    resources :bookings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
