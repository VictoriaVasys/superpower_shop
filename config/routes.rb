Rails.application.routes.draw do
  root to: "sessions#show"
  get '/login', to: 'sessions#new'

  resources :users, only: [:new, :create, :show]

  resources :powers, only: [:index, :show, :destroy]

  resources :briefcases, only: [:create]
  get '/briefcase', to: "briefcases#show"
  put '/briefcase', to: "briefcases#update"
  patch '/briefcase', to: "briefcases#alter_quantity"

  # resources :abilities, only: [:create]
  get '/:category', to: 'categories#show', as: 'category'
end
