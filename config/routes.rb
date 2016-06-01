Rails.application.routes.draw do
  root to: "users#index"

  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create", as: "sessions"

  get "/users/:id/boards", to: "boards#index", as: "user_boards"
  get "/user/:id/boards/new", to: "boards#new", as: "new_board"
  post "/users/:id/boards", to: "boards#create"
  get "/users/:id/boards/:id", to: "boards#show", as: "user_board"
  get "/users/:id/boards/:id/edit", to: "boards#edit", as: "edit_board"
  patch "/users/:id/boards/:id", to: "boards#update"
  delete "/users/:id/boards/:id", to: "boards#destroy", as: "delete_board"

  get "/boards/:id/cards/new", to: "cards#new", as: "new_card"
  post "/boards/:id", to: "cards#create"
  get "/boards/:id/cards/:id", to: "cards#show", as: "card"
  get "/boards/:id/cards/:id/edit", to: "cards#edit", as: "edit_card"
  patch "/boards/:id/cards/:id", to: "cards#update"
  delete "/boards/:id/cards/:id", to: "cards#destroy", as: "delete_card"

end
