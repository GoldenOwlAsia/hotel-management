Rails.application.routes.draw do
  root 'homes#index'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :hotels do
    resources :rooms
  end

  resources :rooms do
    resources :bookings
  end

  resources :bookings do
    member do
      post :check_in
    end
  end
  resources :guests
end
