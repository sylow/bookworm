Bookworm::Application.routes.draw do
  root to: "home#index"
  scope :api do
    resources :books
  end
end
