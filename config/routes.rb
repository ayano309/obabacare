Rails.application.routes.draw do
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
    resources :comments, only: [:create, :destroy]
  end

  resources :vital_months, only: [:index]
  resources :memos, except: [:show]
  
  resource :profile, only: [:show, :edit, :update]
  #既往歴
  resources :medical_histories, except: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
