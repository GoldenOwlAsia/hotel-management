Rails.application.routes.draw do
  get 'booking/new'
  root 'homes#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :hotels do
    resources :rooms
  end
  resources :bookings
end
