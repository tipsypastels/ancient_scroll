Rails.application.routes.draw do
  namespace :admin do
    get '/config', to: 'config#edit'
    post '/config', to: 'config#update'
  end

  namespace :wiki do
    root to: 'welcome#index', as: :welcome
    get '/categories/:object_type', to: 'objects#index', as: :objects

    get '/:id', to: 'objects#show', as: :object
    get '/:id/edit', to: 'objects#edit', as: :edit_object
    patch '/:id', to: 'objects#update' 

    get '/new', to: 'objects#new', as: :new_object
    post '/', to: 'objects#create'
  end

  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register',
    }
end