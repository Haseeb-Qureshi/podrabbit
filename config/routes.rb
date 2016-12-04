Rails.application.routes.draw do
  root 'users#show'
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :podcasts
  get 'client_dashboard' => "client_dashboard#index"
end
