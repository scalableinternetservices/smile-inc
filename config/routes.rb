Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  #the hotfix!
  get '/profiles/:id', :to => 'profiles#show', :as => :user
  resources :profiles
  resources :mood_updates
  resources :moods

end
