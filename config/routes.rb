Rails.application.routes.draw do
  get 'requests/index'
  get 'requests/show'
  get 'requests/edit'
  get 'requests/update'
  get 'requests/destroy'

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
