Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :games
  resources :leagues
  resources :player_games
  resources :players
  resources :sports

  resources :players do
    resources :games
  end

end
