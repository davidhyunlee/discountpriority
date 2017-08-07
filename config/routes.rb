Rails.application.routes.draw do
  get 'orders/index'

  get 'orders/new'

  get 'orders/show'

  get 'orders/edit'

  namespace :admin do
    get 'pages/dashboard'
  end

  get 'sessions/new'
  get '/dashboard' => 'pages#dashboard'

  resources :users, :orders

  namespace :admin do
    get '' => 'pages#dashboard'
    resources :users
  end

  root 'pages#index'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
