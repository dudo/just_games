# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :just_games,
  ecto_repos: [JustGames.Repo]

# Configures the endpoint
config :just_games, JustGames.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ahUELm3JgFomdhKC2WBwXti1QRb7HTiKjboyU/d8JHCRK3MMhRDHXp5a4v/B+pUP",
  render_errors: [view: JustGames.ErrorView, accepts: ~w(html json)],
  pubsub: [name: JustGames.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
