Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :games
  resources :leagues
  resources :player_games
  resources :sports
  resources :players, only: [:create, :show]

  get '/newleague', to: "leagues#new", as: "newleague"
  get '/joinleague', to: "leagues#edit", as: "joinleague"

  get "signup", to: "players#new", as: "signup"
  get "/signin", to: "sessions#new", as: "signin"
  post "/sessions", to: "sessions#create", as: "sessions"
  get '/sessions', to: "sessions#destroy"
  delete "/sessions", to: "sessions#destroy", as: "signout"
  root "sessions#new"

end
