Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
 root 'posts#index'
 resources :posts
 resources :comments, only: %i[create destroy]
end