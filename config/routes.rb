Rails.application.routes.draw do
  resources :games
  resources :teams
  resources :matches

  post '/generate_round_robin/:id', to: 'games#generate_round_robin', as: 'generate_round_robin', action: 'generate_round_robin', controller: :games
  post '/generate_with_all/:id', to: 'games#generate_with_all', as: 'generate_with_all', action: 'generate_with_all', controller: :games

  root to: "teams#index"
end
