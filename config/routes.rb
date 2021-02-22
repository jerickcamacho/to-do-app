Rails.application.routes.draw do
  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/new'
  # get 'categories/edit'
  # get 'categories/create'
  # get 'categories/update'
  # get 'categories/destroy'
  #resources :classifications 
  #resources :lists
  root to:'lists#index' 
  
  resources :categories do
    resources :lists
  end

  #get 'categories/' => 'categories#index', as: 'categories'

  #For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
