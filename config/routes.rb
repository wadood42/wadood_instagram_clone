Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  root to: 'users#index'

  resources :users, only: [:destroy, :new, :create, :show, :update, :index]
  resource :session, only: [:new, :create, :destroy]
end
