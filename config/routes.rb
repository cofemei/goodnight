Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :user_follows, only: [:index, :create, :destroy]
      resources :clocks, only: [:index, :create]
      resources :weekly, only: [:index]
    end
  end
end
