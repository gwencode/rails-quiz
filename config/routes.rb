Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "search", to: "songs#search"
  # get "/search" => "songs#search"

  get "/songs/named/:name" => "songs#named"

  resources :songs do
    resources :reviews, only: [:new, :create]
  end

  # # CREATE
  # get '/songs/new, to: 'songs#new'
  # post '/songs', to: 'songs#create'

  # # READ one
  # get '/songs/:id', to: 'songs#show'

  # # READ all
  # get '/songs', to: 'songs#index'

  # # UPDATE
  # get '/songs/:id/edit', to: 'songs#edit'
  # put '/songs/:id', to: 'songs#update'

  # # DELETE
  # delete '/songs/:id', to: 'songs#destroy'
end

# 1. Request line (HTTP Method + URL). GET, POST, PATCH/PUT, DELETE

# 2. Headers : additional information. Ex: Cookies, Authorization, Content-Type

# 3. Body (optional) : addtional data, send by the client (JSON, XML, plain text... )
# Example :
# POST /api/users HTTP/1.1
# Content-Type: application/json
# {
# "name": "John Doe",
# "email": "johndoe@example.com"
# }

# 4. Method-specific data (query parameters or form data) ?category=rap
# Example (GET request with query parameters):
# GET /songs?category=rap&year=2010
