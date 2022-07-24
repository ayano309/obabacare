Rails.application.routes.draw do
  # 管理者関連
  devise_for :admins, :controllers => {
    :sessions => 'admins/sessions'
  }

  devise_scope :admin do
    get 'dashboard', to: 'dashboard#index'
    get 'dashboard/login', to: 'admins/sessions#new'
    post 'dashboard/login', to: 'admins/sessions#create'
    delete 'dashboard/logout', to: 'admins/sessions#destroy'
    post 'dashboard/guest_sign_in', to: 'admins/sessions#guest_sign_in'
  end

  namespace :dashboard do
    resources :users, only: [:index, :destroy]
    resources :contacts, only: [:index, :show, :update, :destroy]
  end

  #ユーザー関連
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  #ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # top,規約,プライバシーポリシー
  root to: 'homes#index'
  get 'terms', to: 'homes#terms'
  get 'privacy', to: 'homes#privacy'

  resources :vitals do
    #排便機能
    resource :defecations, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy, :update]
    #食事量記録
    resources :meals, only: [:new, :create, :destroy]
  end
  #コメント一覧と重要コメント
  resources :comments, only: [:index]
  resources :comment_importants, only: [:index]

  #感情記録
  resources :emotions, only: [:index]

  resources :vital_months, only: [:index]
  resources :memos, except: [:show]

  #プロフィール
  resource :profile, only: [:show, :edit, :update] do
    #userのパスワード編集、更新、退会
    resource :user, except: [:index,:new,:create]
  end
  #既往歴
  resources :medical_histories, except: [:index, :show]
  #お問い合わせ
  resources :contacts, only: [:index,:create]
  post 'contacts/confirm'
  post 'contacts/back'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
