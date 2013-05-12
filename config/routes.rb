GuitarHouse::Application.routes.draw do
  root to: 'tasks#home'
  get 'signup' => 'users#new', as: :signup
  get 'login' => 'sessions#new', as: :login
  match 'logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: :create
  resources :users
  get 'tag_todo/:tag', to: 'tasks#todo', as: :tag_with_todo
  get 'tags_done/:tag', to: 'tasks#done', as: :tag_with_done
  resources :tasks do
    collection do 
      get 'todo'
      get 'done'
      get 'home'
    end
    put 'finish', on: :member
  end
end
