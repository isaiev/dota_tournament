Rails.application.routes.draw do

  get '/signin' => 'sessions#new', as: :signin
  get '/auth/starladder/callback', to: 'sessions#create', as: :starladder_callback

  post 'sessions/create'

end
