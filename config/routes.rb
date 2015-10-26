Rails.application.routes.draw do

  get 'chroma/index'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  #For profile to update user
  get '/profiles/:id', :to => 'profiles#show', :as => :user

  resources :profiles
  resources :mood_updates
  resources :moods

  root 'chroma#index'

end


  

