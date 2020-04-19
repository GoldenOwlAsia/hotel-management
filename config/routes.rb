Rails.application.routes.draw do
  root 'homes#index'
  post "service_uses/update_service_use", to: "service_uses#update", as: :service_use

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :hotels do
    resources :rooms
  end
  resources :rooms do
    resources :bookings
  end
  resources :bookings do
    resources :orders
  end
  resources :bookings do
    member do
      post :check_in
      post :check_out
    end
  end
  resources :guests
end
