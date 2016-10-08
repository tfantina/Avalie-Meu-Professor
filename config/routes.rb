Rails.application.routes.draw do




  root 'site#index'

  resources :professors do

#  post 'flag' => 'professors#flag'

      collection do
        get 'search'
      end
      member do
        post 'flag', :professor
      end
      resources :reviews, except: [:show, :index]
  end

  resources :users
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  resources :admins
  get 'admin' => 'admin#index'



end
