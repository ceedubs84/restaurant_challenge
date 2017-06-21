Rails.application.routes.draw do
  get 'orders/show'

  resources :menu_items
  resources :carted_menu_items

  get '/' => 'pages#index'
  get '/about' => 'pages#about'
  get '/panel' => 'pages#admin_panel'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
