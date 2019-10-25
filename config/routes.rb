Rails.application.routes.draw do

  # root
  root to: 'tasks#index'

  # tasks
  resources :tasks do
  end

  # users
  resources :users do
  end

  # session
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
