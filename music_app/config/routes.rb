Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :artists
      resources :songs
    end
  end
end
