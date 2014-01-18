Chno::Application.routes.draw do
  root 'events#index'

  resources :events do
    resources :projects
  end

  resources :users

  get '/signin', to: "sessions#new"
  post "/signin", to: "sessions#create"
end
