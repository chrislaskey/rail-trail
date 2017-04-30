Rails.application.routes.draw do

  resources :surveys, only: [:show]

  root to: "home#index"

end
