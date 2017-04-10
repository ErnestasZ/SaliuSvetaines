Rails.application.routes.draw do
  #get 'sessions/new'#, to: 'sessions#new'
  resources :sessions, except: [:new]
  get 'admin', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#index"


  get "/categories", to: "pages#categories", as: 'categories'
  post "/categories", to: "pages#import_csv_stamperija", as: 'import_csv_stamperija'


  get "stamp", to: "pages#stamp"

  get "/category/:id/stamps", to: "pages#stamps", as: 'stamps'

  get "/contact_us", to: "contact#index"
  post '/contact_us', to: 'contact#new_mail'


end
