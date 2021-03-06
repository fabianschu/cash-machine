Rails.application.routes.draw do
  root 'welcome#index'
  
  resources :customers, shallow: true do
    resources :invoices  do
      resources :positions
    end
  end
  get 'invoices/:id/pdf' => 'invoices#invoice_pdf'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
