Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
        get '/revenue', to: "revenue#show"
        get "/most_items", to: "most_items#index"
        get "/most_revenue", to: "most_revenue#index"
        get "/:id/favorite_customer", to: "favorite_customer#show"
        get "/:id/revenue", to: "total_revenue#show"
        get "/:id/items", to: "items#index"
        get "/:id/invoices", to: "invoices#index"
        get "/:id/customers_with_pending_invoices", to: "pending_invoices#index"
      end
      resources :merchants, only: [:index, :show]

      namespace :items do
        get "/find_all", to: "search#index"
        get "/find", to: "search#show"
        get "/random", to: "random#show"
        get "/most_revenue", to: "most_revenue#index"
        get "/most_items", to: "most_items#index"
        get "/:id/best_day", to: "best_day#show"
        get "/:id/invoice_items", to: "invoice_items#index"
        get "/:id/merchant", to: "merchant#show"
      end
      resources :items, only: [:index, :show]

      namespace :customers do
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
        get '/:id/favorite_merchant', to: 'favorite_merchant#show'
        get '/:id/invoices', to: 'customer_invoices#index'
        get '/:id/transactions', to: 'customer_transactions#index'
      end
      resources :customers, only: [:index, :show]

      namespace :transactions do
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
        get '/:id/invoice', to: "invoice#show"
      end
      resources :transactions, only:[:index, :show]

      namespace :invoices do
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
        get "/:id/transactions", to: "transactions#index"
        get "/:id/invoice_items", to: "some_invoice_items#index"
        get "/:id/items", to: "some_items#index"
        get "/:id/customer", to: "customer#show"
        get "/:id/merchant", to: "merchant#show"
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
        get "/:id/invoice", to: "invoice#show"
        get "/:id/item", to: "item#show"
      end
      resources :invoice_items, only: [:index, :show]


    end
  end

end
