Rails.application.routes.draw do

  get 'searchs/search'
  namespace :users do
    get 'recommendations/show'
    get 'recommendations/new'
  end
  namespace :users do
    get 'groups/index'
    get 'groups/new'
    get 'groups/edit'
  end
  namespace :users do
    get 'friends/index'
  end
  namespace :users do
    get 'productions/show'
    get 'productions/new'
    get 'productions/create'
    get 'productions/edit'
    get 'productions/update'
    get 'productions/destroy'
  end
  namespace :users do
    get 'shelfs/show'
    get 'shelfs/new'
    get 'shelfs/create'
    get 'shelfs/edit'
    get 'shelfs/update'
    get 'shelfs/destroy'
  end
  namespace :users do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/destroy'
    get 'users/quit'
    get 'users/quit_update'
  end
  namespace :admins do
    get 'groups/index'
  end
  namespace :admins do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  get 'homes/top'
  get 'users/top'
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
