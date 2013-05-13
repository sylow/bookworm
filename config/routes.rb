Bookworm::Application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :books
    end
  end
  
  root to: "home#index"
end
