Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'fans#index'
  get '/signup' => 'fans#new', as: 'signup'
  post '/signup' => 'fans#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  patch '/teams/:team_id/players' => 'players#update'
  resources :fans

  resources :teams do
  resources :fanteams
  resources :players
  end

  

end

