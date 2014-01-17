Chno::Application.routes.draw do
  get "users/new"
  get "users/create"
  get "users/show"
  root 'events#index'

  resources :events do
    resources :projects
  end

  resources :users
end
