Rails.application.routes.draw do

  root 'trips#index'

  resources :drivers

  resources :passengers do
    resources :trips, only: [:create]
  end

  resources :trips, except: [:new]

end
