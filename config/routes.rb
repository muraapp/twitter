Rails.application.routes.draw do
  resources :tweets, only: [:index,:new,:create,:edit,:update,:destroy]
end
