Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#index"

  get "/categories", to: "pages#categories", as: 'categories'
  post "/categories", to: "pages#import_csv_stamperija", as: 'import_csv_stamperija'
  get "/category/:id/stamps", to: "pages#stamps", as: 'stamps'
end
