Rails.application.routes.draw do

  root to: 'teams#index'

  get '/signin' => 'sessions#new', as: :signin
  get '/signout' => 'sessions#destroy', as: :signout
  get '/auth/starladder/callback', to: 'sessions#create', as: :starladder_callback

  resources :tournaments, only: [:show, :index]
  resources :team_tournaments, only: [:create, :destroy]
  resources :teams, only: [:create, :index, :new, :edit, :update, :destroy]

end
