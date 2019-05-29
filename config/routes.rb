Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :places do
    resources :bookings, except: [:index, :destroy] do
      get 'confirmation', to: 'bookings#confirmation', as: :confirmation
    end
    resources :reviews, only: :create
  end


  get 'bookings', to: 'bookings#index', as: :bookings
  resources :bookings, only: :destroy

  # delete "reviews/:id", to: "reviews#destroy"
  resources :reviews, only: :destroy

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
