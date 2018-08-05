Rails.application.routes.draw do
  
  devise_for :users
  root "web/common/articles#index"

  namespace :web do
    namespace :admin do
      resources :articles do
      end
    end

    namespace :common do
      resources :articles, only: [:index,:show] do
      end
    end
  end

end
