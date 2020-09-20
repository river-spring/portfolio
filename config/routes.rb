Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#new_guest'
  end
  root to: 'homes#top'
  get 'search' => 'searchs#search'
  get 'admin_search' => 'searchs#admin_search'
  namespace :users do
    get 'users/quit' => 'users#quit'
    patch 'users/quit_update' => 'users#quit_update'
    resources :users, only: %i[show edit update destroy] do
      resources :friends, only: %i[index create update destroy]
      resources :recommendations, only: %i[show new create update destroy]
      collection do
        get :history
        get :edit_password
        patch :password_update
      end
    end
    resources :shelves, only: %i[show new create edit update destroy] do
      resources :productions, only: %i[show new create destroy] do
        collection do
          get :search
        end
        resources :comments, only: %i[create destroy]
      end
    end
    resources :groups
  end
  namespace :admins do
    resources :users, only: %i[index show edit update]
    resources :groups, only: %i[index show edit update destroy]
    get 'comments/check' => 'comments#check'
    get 'comments/comments_check' => 'comments#comments_check'
    resources :shelves, only: %i[index show edit update destroy] do
      resources :productions, only: [:destroy] do
        resources :comments, only: %i[index destroy]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
