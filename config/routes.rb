Rails.application.routes.draw do

resources :drivers
resources :passengers do
  resources :trips, only: [:create]
end

resources :trips do
end

end
