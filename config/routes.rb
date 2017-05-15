Rails.application.routes.draw do
  get 'errors/index'

  get 'settings/edit'
  post 'settings/update'

  get '', to: 'quotes#index'
  get 'quotes/update'

  get 'stock_reports/generate'
  get 'stock_reports', to: 'stock_reports#index'
  get 'stock_reports/download/:id', to: 'stock_reports#download'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
