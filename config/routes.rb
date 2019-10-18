Rails.application.routes.draw do

  # root
  root to: 'tasks#index'

  # tasks
  resources :tasks do
  end

end
