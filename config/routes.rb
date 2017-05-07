Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :user do
    match "sign_out", to: "devise/sessions#destroy", via: [:delete, :get], as: :user_log_out
  end

  resources :surveys, only: [:show] do
    member do
      get :take
      post :submit
    end
  end

  root to: "home#index"

end
