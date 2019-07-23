Rails.application.routes.draw do
  get 'booking/new'
  root 'homes#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :hotels do
    resources :rooms, only: [:index]
  end
  resources :rooms do
    collection do
      get :search
    end
  end
  resources :bookings
end
