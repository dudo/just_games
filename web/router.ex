defmodule JustGames.Router do
  use JustGames.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JustGames do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/user", UserController
    resources "/game", GameController
    resources "/match", MatchController
  end

  # Other scopes may use custom stacks.
  # scope "/api", JustGames do
  #   pipe_through :api
  # end
end
