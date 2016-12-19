defmodule JustGames.PageController do
  use JustGames.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
