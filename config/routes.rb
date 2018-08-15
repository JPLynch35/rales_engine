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
        get 'merchant', to: 'merchants#index'
        get 'invoice_items', to: 'invoices/invoice_items#index'
        get 'transactions', to: 'invoices/transactions#index'
        get 'customer', to: 'invoices/customer#index'
      end

      namespace :merchants do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#show'
      end
      resources :merchants, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :items, only: [:index]
      end

      namespace :items do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#show'
      end
      resources :items, only: [:index, :show]
    end
  end
end
