Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/sign_up', to: 'users#create'
      resources :clicks
          # get 'get_clicks', to: 'clicks#index'
          # post 'add_click', to: 'clicks#create'
      resources :images
          # post '/', to: 'auth#create'
          # get '/current_user', to: 'auth#show'
      resources :users
          post '/login', to: 'auth#create'
          get '/current_user', to: 'auth#show'

    end
  end
end