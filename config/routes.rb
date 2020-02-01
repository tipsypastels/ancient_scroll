Rails.application.routes.draw do
  namespace :admin do
    root to: 'land#index', as: :land

    get '/config', to: 'config#edit'
    post '/config', to: 'config#update'
  end

  namespace :wiki do
    Wiki::Object.types_not_disabled
                .each_key(&method(:resources))

    get '/:id', to: 'intrinsics#show', 
      constraints: { id: Wiki::Sheet::Intrinsic::ROUTE_REGEX },
      as: :intrinsic

    root to: 'root#index'
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