Rails.application.routes.draw do
  resources :games, except: [:show] do
    resources :matches, only: [:index]
    resources :scores, only: [:index]
  end
  post '/generate_round_robin/:id', to: 'games#generate_round_robin', as: 'generate_round_robin', action: 'generate_round_robin', controller: :games
  post '/generate_with_all/:id', to: 'games#generate_with_all', as: 'generate_with_all', action: 'generate_with_all', controller: :games

  resources :teams, except: [:show] do
    resources :matches, only: [:index]
  end

  resources :matches, except: [:show] do
    resources :scores, only: [:index]
  end

  resources :scores, only: [:index, :edit, :update]

  root to: "teams#index"
end
