Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :friends
  resources :bills
end
