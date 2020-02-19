Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }
   
 root 'posts#index'
 resources :posts
 resources :comments, only: %i[create destroy]
 resources :testsessions, only: :create
end

