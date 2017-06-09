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

  # The show endpoint is cached by NGINX, so need to submit updates
  # to a different URI. Otherwise identical to a typical resource.
  resources :open_letters, except: [:update], path: "open-letters" do
    member do
      patch :update, as: :update
    end
  end

  root to: "home#index"

end
