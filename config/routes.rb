Rails.application.routes.draw do
  root to: "jobs#index"
  devise_for :users
  resources :jobs do 
    collection do
      get "/search", to: "jobs#search"
    end
  end
end
