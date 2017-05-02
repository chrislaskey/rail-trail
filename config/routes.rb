Rails.application.routes.draw do

  resources :surveys, only: [:show, :create, :update] do
    member do
      get :take
    end
  end

  root to: "home#index"

end
