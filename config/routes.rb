Rails.application.routes.draw do
  get '/' => 'requests#index'
  resources :requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
