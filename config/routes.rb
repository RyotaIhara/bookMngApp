Rails.application.routes.draw do
  resources :users
  resources :tags
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  'study_types#index'

  resources :users, :only => [:new, :create]
  # ログイン / ログアウト
  get     'login',   to: 'sessions#new'
  post    'login',   to: 'sessions#create'
  delete  'logout',  to: 'sessions#destroy'

  resources :study_books
  resources :study_types, :only => [:index, :show, :create, :update, :destroy]
  resources :tags, :only => [:index, :show, :create, :update, :destroy]
end
