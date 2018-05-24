Rails.application.routes.draw do
  resources :games
  resources :teams
  resources :matches

  root to: "teams#index"
end
