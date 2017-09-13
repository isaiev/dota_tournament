Rails.application.routes.draw do

  root to: 'index#index'

  get '/signin' => 'sessions#new', as: :signin
  get '/auth/starladder/callback', to: 'sessions#create', as: :starladder_callback

  resources :tournaments, only: [:show, :index]

end
