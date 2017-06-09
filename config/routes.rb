Rails.application.routes.draw do

  root 'site#index'
  get 'terms', to: 'site#terms'

#all routes for professors
  resources :professors do
      collection do
        get 'search'
        get 'schools'
      end
      member do
        post 'flag', :professor
      end
      resources :reviews  do
        member do
          post 'flag', 'vote', 'downvote',  :review
        end
      end
  end

#all routes for administrators
  devise_for :users
  get 'users/search'
  get '/toggle-admin', to: 'users#toggle_admin', as: 'toggle_admin'
  resources :admins, only: [:show]



end
