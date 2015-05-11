Rails.application.routes.draw do
  root to: 'application#index'

  devise_for :companies
  devise_for :developers

  resources :companies, defaults: { format: :json } do
    member do
      post 'create_ticket'
    end
  end
  resources :developers, defaults: { format: :json } do
    member do
      post 'choose_ticket'
    end
  end
end
