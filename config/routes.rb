Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :users

  get "/tweets/new" => "tweets#new"
  get "/tweets/:username" => "tweets#show", as: 'tweets_from'
  post "/tweets" => "tweets#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
