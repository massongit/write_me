# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)' do
    get '/' => 'requests#index', as: 'root'
    resources :requests
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
