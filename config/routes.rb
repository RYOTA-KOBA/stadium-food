Rails.application.routes.draw do

 root 'posts#index'

 devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'
 }

 devise_scope :user do
  get 'users/:id/edit' => 'users/registrations#edit', as: :user_edit
  patch 'users/:id' => 'users/registrations#update'
  put 'users/:id' => 'users/registrations#update'
 end

 resources :posts
 resources :comments, only: %i[create destroy]
 resources :testsessions, only: :create
 resources :users, only: %i[show]
end

