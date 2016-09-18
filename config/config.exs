# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :socket_poc,
  ecto_repos: [SocketPoc.Repo]

# Configures the endpoint
config :socket_poc, SocketPoc.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5/xUsZmkmsnhemCGeUkUFfjsBFHLYzUsVxbm+YS7QqbBF0U3F3nGPd6uKhbQDq/m",
  render_errors: [view: SocketPoc.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SocketPoc.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
