Rails.application.routes.draw do
  resources :users
  resources :tags
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'study_books#index'

  resources :users, :only => [:new, :create]
  # ログイン / ログアウト
  get     'login',   to: 'sessions#new'
  post    'login',   to: 'sessions#create'
  delete  'logout',  to: 'sessions#destroy'

  # ユーザー名変更
  get 'users/:id/edit_name', to: 'users#edit_name'
  post '/users/:edit_name', to: 'users#update_name'

  # パスワード変更画面遷移
  get 'users/:id/edit_password', to: 'users#edit_password'
  # パスワードリセット画面遷移(パスワードを忘れた場合)
  get 'user/confirm_name', to: 'users#confirm_name'
  post 'user/confirm_name', to: 'users#edit_password_from_confirm_name'
  # パスワード変更
  post '/users/:id/edit_password', to: 'users#update_password'

  resources :study_books
  resources :study_types, :only => [:index, :show, :create, :update, :destroy]
  resources :tags, :only => [:index, :show, :create, :update, :destroy]
end
