Rails.application.routes.draw do
  resources :monsters
  resources :maps
  resources :mtypes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match ':controller(/:action(/:id(.:format)))', :via => :all
  root :to => 'user#index'
end
