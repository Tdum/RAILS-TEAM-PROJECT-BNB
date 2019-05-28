Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :places do
    resources :bookings, except: :index
    resources :reviews, only: :create
  end

  get 'bookings', to: 'bookings#index', as: :bookings


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
