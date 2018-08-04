Rails.application.routes.draw do
  
  root "webadmmin/articles#index"
  # resources :articles

  namespace :web do
    namespace :admin do
      resources :articles do
      end
    end
  end

end
