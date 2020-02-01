Rails.application.routes.draw do
  namespace :admin do
    root to: 'land#index', as: :land

    get '/config', to: 'config#edit'
    post '/config', to: 'config#update'
  end

  namespace :wiki do
    Wiki::Object.types.each_key(&method(:resources))

    get '/:id', to: 'intrinsics#show', 
      constraints: { id: Wiki::Sheet::Intrinsic::ROUTE_REGEX },
      as: :intrinsic

    root to: 'root#index'

    # root to: 'root#index', as: :root
    # get '/categories/:object_type', to: 'object_categories#show', as: :objects
    # get '/categories/:object_type/new', to: 'object_categories#new', as: :new_object
    # post '/categories/:object_type', to: 'object_categories#create'

    # get '/:id', to: 'objects#show', as: :object
    # get '/:id/edit', to: 'objects#edit', as: :edit_object
    # patch '/:id', to: 'objects#update' 

    # post '/', to: 'objects#create'
  end

  get '/@:id', to: 'users#show', as: :user
  
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register',
    }
end