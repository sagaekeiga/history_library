Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/manage'

  namespace :api, { format: 'json' } do
    namespace :v1, { format: 'json' } do 
      post 'cards/search'
      post 'cards/detail'
    end
  end
  resources :cards

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
