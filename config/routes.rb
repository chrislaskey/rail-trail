Rails.application.routes.draw do

  resources :surveys, only: [:show] do
    member do
      get :take
      post :create
      patch :update
    end
  end

  root to: "home#index"

end
