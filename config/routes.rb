Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :people, only: [:index, :show, :create, :update, :destroy]
      resources :vehicles, only: [:index, :show, :create, :update, :destroy]
      resources :reports, only: [:new]
    end
  end
end
