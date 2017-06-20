Rails.application.routes.draw do
  get 'menu_items/index'

  get 'menu_items/new'

  get 'menu_items/show'

  get 'menu_items/edit'

  get 'pages/index'

  get 'pages/about'

  get 'pages/admin_panel'

  resources :menu_items

  get '/about' => 'pages#about'
  get '/panel' => 'pages#admin_panel'

  get '/signup' => 'users#new'
  post '/users' => 'users#new'
  get '/login' => 'users#new'
  post '/login' => 'users#new'
  get '/logout' => 'users#new'
end
