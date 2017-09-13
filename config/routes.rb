Rails.application.routes.draw do

  get 'tournaments/index'

  root to: 'index#index'

  get '/signin' => 'sessions#new', as: :signin
  get '/auth/starladder/callback', to: 'sessions#create', as: :starladder_callback

  post 'sessions/create'
end
