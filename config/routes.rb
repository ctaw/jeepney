Rails.application.routes.draw do

  devise_for :user, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  
  root :to => "site/home#index"

  namespace :admin do 
    resources :dashboard
    resources :routes
    resources :fares
  end
  
end