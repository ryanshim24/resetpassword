Rails.application.routes.draw do

  ### ACCESS + MAIN ROUTES
  root 'access#login'

  get 'forgot', to: "access#forgot", as: 'forgot'

  post 'forgot', to: "access#password_reset"

  get '/', to: 'access#login'

  get 'index', to: 'access#login'

  post 'signup', to: 'access#create', as: 'create_user'

  get 'signup', to: 'access#new'

  get 'home', to: 'users#index'

  get 'login', to: 'access#login', as: 'login'

  get 'logout', to: 'access#logout'

  post 'login', to: 'access#attempt_login'

  get 'reset/:user_reset_token', to: 'access#reset', as: 'reset'

  patch 'reset/:user_reset_token', to: 'access#reset_password'

  ### USERS ROUTES
  get 'users', to: 'users#index', as: 'users'

  get 'users/:id/edit', to: 'users#edit', as: 'users_edit'

  get 'users/:id', to: 'users#show', as: 'users_show'

  delete 'users/:id', to: 'users#destroy'

  patch 'users/:id/edit', to: 'users#update'

  ### ORDER ROUTES

  get 'users/:user_id/orders', to: 'orders#index', as: 'orders'

  get 'users/:user_id/orders/:order_id/edit', to: 'orders#edit', as: 'orders_edit'

  get 'users/:user_id/orders/new', to: 'orders#new',  as: 'orders_new'

  get 'users/:user_id/orders/:order_id', to: 'orders#show', as: 'orders_show'

  post 'users/:user_id/orders/new', to: 'orders#create'

  # patch 'users/:user_id/orders/:order_id', to: 'orders#update'

  # delete 'users/:user_id/orders/:order_id', to: 'orders#destroy'

  ### PRODUCTS ROUTES
  get 'products', to: 'products#index', as: 'products'

  get 'products/:id/edit', to: 'products#edit', as: 'products_edit'

  get 'products/new', to: 'products#new'

  get 'products/:id', to: 'products#show', as: 'products_show'

  post 'products/create', to: 'products#create'

  patch 'products/:id/edit', to: 'products#update'

  delete 'products/:id', to: 'products#destroy'

end
