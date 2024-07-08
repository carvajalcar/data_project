Rails.application.routes.draw do
  get 'pages/about'
  resources :teams, only: [:index, :show] do
    get 'statistics', on: :member
    get 'classification', on: :member
  end

  resources :players, only: [:index, :show]

  get 'about', to: 'pages#about'

  root 'teams#index'
end


