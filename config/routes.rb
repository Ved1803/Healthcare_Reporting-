Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check
  post "/login", to: "auth#login"
  post "/signup", to: "auth#signup"

  namespace :api do
    namespace :v1 do
      resources :reports, only: [:index, :create] do
        member do
          patch :submit
          patch :approve
          patch :reject
          patch :start_review
        end
        resources :comments, only: [:index, :create]
      end
    end
  end
end
