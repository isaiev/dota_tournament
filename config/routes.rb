Rails.application.routes.draw do

  root to: 'teams#index'

  get '/signin' => 'sessions#new', as: :signin
  get '/auth/starladder/callback', to: 'sessions#create', as: :starladder_callback

  resources :tournaments, only: [:show, :index]
  resources :teams, only: [:create, :index, :new, :edit, :update, :destroy]

end
