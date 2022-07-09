Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: 'homes#index'
  get 'terms', to: 'homes#terms'
  get 'privacy', to: 'homes#privacy'
  
  resources :vitals do
    resource :defecations, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :vital_months, only: [:index]
  resources :memos, except: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
