Rails.application.routes.draw do
  root 'homes#index'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :hotels do
    resources :rooms
  end

  resources :rooms do
    resources :bookings
  end

  resources :guests
end
