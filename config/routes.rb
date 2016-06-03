Rails.application.routes.draw do
  root to: "users#index"
  get "/about", to: "about#show", as: "about"

  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create", as: "sessions"

  get "/users/:id/boards/new", to: "boards#new", as: "new_board"
  post "/users/:id", to: "boards#create"
  get "/users/:id/boards/:board_id", to: "boards#show", as: "board"
  get "/users/:id/boards/:board_id/edit", to: "boards#edit", as: "edit_board"
  patch "/users/:id/boards/:board_id", to: "boards#update"
  delete "/users/:id/boards/:board_id", to: "boards#destroy", as: "delete_board"

  get "/boards/:board_id/cards/new", to: "cards#new", as: "new_card"
  post "/boards/:board_id/cards", to: "cards#create", as: "board_cards"
  get "/boards/:board_id/cards/:card_id", to: "cards#show", as: "card"
  get "/boards/:board_id/cards/:card_id/edit", to: "cards#edit", as: "edit_card"
  patch "/boards/:board_id/cards/:card_id", to: "cards#update"
  delete "/boards/:board_id/cards/:card_id", to: "cards#destroy", as: "delete_card"

end
