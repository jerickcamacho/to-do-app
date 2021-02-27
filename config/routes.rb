Rails.application.routes.draw do
  devise_for :users
  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/new'
  # get 'categories/edit'
   #get 'categories/create'
   #get 'categories/update'
  # get 'categories/destroy'
  #resources :classifications 
  #resources :lists
  root to:'categories#index' 

  post '/lists/index_tasks_today', to: 'lists#index'

  resources :users do
    resources :categories do
      resources :lists
    end
  end
  #get 'categories/' => 'categories#index', as: 'categories'

  #For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
