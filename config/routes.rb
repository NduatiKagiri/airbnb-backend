Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
    namespace :api, defaults: { format: :json } do
    namespace :v1 do
  resources :users
  post '/auth/login', to: 'authentication#login'
  resources :houses
  resources :reservations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    end
  end
  root 'api/v1/houses#index'
end


