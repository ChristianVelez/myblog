Rails.application.routes.draw do
  resources :posts
  root "posts#index"

  get "posts/new"
end
