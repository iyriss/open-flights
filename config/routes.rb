Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :airlines, param: :slug #we'll use slug instead of using id as the primary param for airlines in routing
      resources :reviews, only: [:create, :destroy]
    end
  end

  #This route requests that aren't for existing paths predefined in our API back to our index path so this will allow React Router to handle routing to our react components without interfering with our actual rails routes for our API
  get '*path', to: 'pages#index', via: :all
end
