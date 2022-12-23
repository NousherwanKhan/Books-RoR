Rails.application.routes.draw do
 
  root 'publics#index'

resource :tests, :except => [:show]

  
  # pubic controller route
  get 'show/:permalink', to: 'publics#show'

  # user controller routes
  get '/login', to: 'users#login'
  post '/login_attempt', to: 'users#login_attempt'
  get 'admin/logout', to: 'users#logout'
  get 'admin/index', to: 'users#index'

  # AdminUser Controller routes
  get 'admin/users/index', to: 'admin_users#index', as: 'index_admin'
  get 'admin/users/new', to: 'admin_users#new', as: 'new_admin'
  post 'admin/users/create', to: 'admin_users#create', as: 'create_admin'
  get 'admin/users/:id/edit', to: 'admin_users#edit', as: 'edit_admin'
  post 'admin/users/:id', to: 'admin_users#update', as: 'update_admin'
  get 'admin/users/:id', to: 'admin_users#destroy', as: 'destroy_admin'

  # Subject Controller routes
  get 'admin/subjects/index/', to: 'subjects#index', as: 'index_subject'
  get 'admin/subjects/show', to: 'subjects#show', as: 'show_subject'
  get 'admin/subjects/new', to: 'subjects#new', as: 'new_subject'
  post 'admin/subjects/create', to: 'subjects#create', as: 'create_subject'
  get 'admin/subjects/:id/edit', to: 'subjects#edit', as: 'edit_subject'
  post 'admin/subjects/users/:id', to: 'subjects#update', as: 'update_subject'
  get 'admin/subjects/:id/delete', to: 'subjects#delete'
  post 'admin/subjects/:id', to: 'subjects#destroy'

  # Pages Controller route
  get 'admin/subjects/pages/index', to: 'pages#index'
  get 'admin/subjects/pages/new', to: 'pages#new'
  get 'admin/subjects/pages/:id', to: 'pages#show'
  post 'admin/subjects/pages/create', to: 'pages#create'
  get 'admin/subjects/pages/:id/edit', to: 'pages#edit'
  post 'admin/subjects/pages/:id', to: 'pages#update'
  get 'admin/subjects/pages/:id/delete', to: 'pages#delete'
  delete 'admin/subjects/pages/:id', to: 'pages#destroy'


  # Section Controller route
  get 'admin/subjects/pages/sections/index', to: 'sections#index'
  get 'admin/subjects/pages/sections/new', to: 'sections#new'
  get 'admin/subjects/pages/sections/:id', to: 'sections#show'
  post 'admin/subjects/pages/sections/create', to: 'sections#create'
  get 'admin/subjects/pages/sections/:id/edit', to: 'sections#edit'
  post 'admin/subjects/pages/sections/:id', to: 'sections#update'
  get 'admin/subjects/pages/sections/:id/delete', to: 'sections#delete'
  delete 'admin/subjects/pages/sections/:id', to: 'sections#destroy'

  match ':controller(/:action(/:id))', :via => [:get, :post]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
