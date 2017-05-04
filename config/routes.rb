Rails.application.routes.draw do
  root "pages#index"

  get "sign-in", to: "sessions#new", as: :sign_in
  post "sign-in", to: "sessions#create"
  delete "sign-out", to: "sessions#destroy"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :venues, only: [:show] do
        resources :reviews, only: [:index]
      end
    end
  end
end
