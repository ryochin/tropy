Rails.application.routes.draw do
  resources :entries, except: [:destroy], format: false, path: '/'
end
