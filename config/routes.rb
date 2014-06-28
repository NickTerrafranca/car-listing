Rails.application.routes.draw do
  # root 'cars#index'
  resources :manufacturers, only: [:index, :show, :new, :create]
  resources :cars, only: [:index, :show, :new, :create]
end
