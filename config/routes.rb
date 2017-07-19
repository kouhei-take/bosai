Rails.application.routes.draw do
  # get 'items_requests/index'
  # get 'items_requests/show'
  # get 'items_requests/create'
  # get 'items_requests/new'
  # get 'items_requests/edit'
  # get 'items_requests/delete'
  # get 'requests/index'
  # get 'requests/show'
  # get 'requests/edit'
  # get 'requests/update'
  # get 'requests/destroy'
  get 'requests/list'

  get 'pages/home'
  root to: 'pages#home'

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :requests do
      resources :items_requests
    end
  end
end
