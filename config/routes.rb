Rails.application.routes.draw do
  root 'customers#index'
  
  resources :customers, shallow: true do
    resources :invoices  do
      resources :positions
    end
  end

  get 'static_pdf' => 'invoice_pdfs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
