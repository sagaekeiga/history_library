Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/manage'
  
  resources :characters
  resources :eras
  resources :events

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
