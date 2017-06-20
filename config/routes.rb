Rails.application.routes.draw do
  resources :menu_items

  get '/' => 'pages#index'
  get '/about' => 'pages#about'
  get '/panel' => 'pages#admin_panel'

  get '/signup' => 'users#new'
  post '/users' => 'users#new'
  get '/login' => 'users#new'
  post '/login' => 'users#new'
  get '/logout' => 'users#new'
end
