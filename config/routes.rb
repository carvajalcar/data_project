Rails.application.routes.draw do
  resources :teams, only: [:index, :show] do
    get 'statistics', on: :member
    get 'classification', on: :member
  end

  resources :players, only: [:index, :show]

  get 'about', to: 'pages#about'
  get 'members', to: 'members#index'

  root 'teams#index'
end

