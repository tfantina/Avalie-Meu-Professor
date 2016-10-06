Rails.application.routes.draw do


  resources :professors do

      collection do
        get 'search'
      end
      resources :reviews, except: [:show, :index]
  end

  root 'site#index'

  resources :users
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  resources :admins
  get 'admin' => 'admin#index'



end
