Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :invoices do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#show'
      end
      resources :invoices, only: [:index, :show] do
        resources :items, only: [:index]
        resources :invoice_items, only: [:index]
        get 'merchant', to: 'merchants#show'
        get 'transactions', to: 'invoices/transactions#index'
        get 'customer', to: 'invoices/customer#show'
      end

      namespace :merchants do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#show'
        get 'revenue', to: 'daily_revenue#show'
      end
      resources :merchants, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :items, only: [:index]
        get 'favorite_customer', to: 'merchants/favorite_customer#show'
      end

      namespace :items do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#show'
        get 'most_revenue', to: 'most_revenue#index'
      end
      resources :items, only: [:index, :show] do
        resources :invoice_items, only: [:index]
        get 'merchant', to: 'merchants#show'
      end
    end
  end
end
