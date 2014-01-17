Chno::Application.routes.draw do
  root 'events#index'

  resources :events do
    resources :projects
  end
end
