Rails.application.routes.draw do
  get 'requests/index'
  get 'requests/show'
  get 'requests/edit'
  get 'requests/update'
  get 'requests/destroy'

  get 'pages/home'
  root to: 'pages#home'

  # ####################################
  # get '/users/:id/requests', to: 'requests#index', as: :user_root
  # ####################################

  #user_root_path to: 'requests#index'

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :requests
  end
end
