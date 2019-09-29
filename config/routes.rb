Rails.application.routes.draw do
  # get 'users/show'
  
  devise_for :users  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root :to=> 'home#job'
 get '/home/about' => 'home#about'
 resources :books, only: [:show, :index, :edit, :update, :destroy, :create]
 resources :users, only: [:show, :edit, :update, :index]
 
  devise_scope :social_account do
  # get 'sign_out', to: "sessions#destroy"
 end


end