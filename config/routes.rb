Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :entries, except: [:destroy], format: false, path: '/'
end
