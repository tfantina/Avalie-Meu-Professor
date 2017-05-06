Rails.application.routes.draw do
  devise_for :admins
  root 'site#index'
  get 'terms' => 'site#terms'

  resources :professors do
      collection do
        get 'search'
      end
      collection do
        get 'schools'
      end
      member do
        post 'flag', :professor
      end
      resources :reviews  do
        member do
          post 'flag', 'vote', 'downvote',  :review
        end
        resources :reviews, only: [:index, :create, :show]


      end

  end

  resources :reviews, only: [:destroy, :update, :edit]


  resources :users
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  resources :admins
  get 'admin' => 'admin#index'



end
