Rails.application.routes.draw do
  
  root 'web/common/home#index'
  devise_for :users, controllers: {
    sessions: 'web/users/sessions',
    registrations: 'web/users/registrations',
    passwords: 'web/users/passwords',
    confirmations: 'web/users/confirmations',
  }, path: ''

  scope module: :web do
    scope module: :common do
      resources :articles, only: [:index,:show] do
        scope module: :articles do
          resources :comments, only: [:create, :destroy]
        end
      end
      get '/blog', to: 'articles#index'
      get '/blog/:id', to: 'articles#show'
    end

    namespace :admin do
      resources :articles do
        member do
          put :unarchieve
          put :archieve
        end
      end
    end
  end

end
