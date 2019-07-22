Rails.application.routes.draw do
  root 'hotels#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :hotels do
    resources :rooms, only: [:index]
  end
  resources :rooms do
    collection do
      get :search
    end
  end
end
