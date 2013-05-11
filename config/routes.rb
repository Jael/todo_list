GuitarHouse::Application.routes.draw do
  root to: 'tasks#todo'
  get 'signup' => 'users#new', as: :signup
  get 'login' => 'sessions#new', as: :login
  match 'logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: :create
  resources :users
  resources :tasks do
    collection do 
      get 'todo'
      get 'done'
      get 'home'
    end
    put 'finish', on: :member
  end
end
