Rails.application.routes.draw do




  root 'site#index'
  get 'terms' => 'site#terms'

  resources :professors do

#  post 'flag' => 'professors#flag'

      collection do
        get 'search'
      end
      collection do
        get 'schools'
      end
      member do
        post 'flag', :professor
      end
      resources :reviews, except: [:show, :index]
  end


  resources :reviews do
    member do
      post 'flag', 'vote', 'downvote',  :review
    end

     delete 'reviews/destroy' => 'reviews#destroy'
  end

  resources :users
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  resources :admins
  get 'admin' => 'admin#index'



end
