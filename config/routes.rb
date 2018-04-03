Rails.application.routes.draw do
  get 'drivers/index'

  get 'passengers/index'

  get 'trips/index'

  get '/trips', to: 'trips#index', as: 'trips'
  get '/trips/new', to: 'trips#new', as: 'new_trip'
  post '/trips', to: 'trips#create'

  get '/trips/:id', to: 'trips#show', as: 'trip'
  get '/trips/:id/edit', to: 'trips#edit', as: 'edit_trip'
  patch '/trips/:id', to: 'trips#update'
  delete '/trips/:id', to: 'trips#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
