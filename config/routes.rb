Bookworm::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books
    end
  end

  root to: "home#index"
end
