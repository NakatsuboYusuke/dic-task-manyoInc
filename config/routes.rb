Rails.application.routes.draw do

  # root
  root to: 'tasks#index'

  # admin/users
  namespace :admin do
    resources :users do
    end
  end

  # users
  resources :users do
  end

  # tasks
  resources :tasks do
  end

  # sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # errors
  get '*anything', to: 'errors#routing_error'

end
