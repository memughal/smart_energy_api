use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :socket_poc, SocketPoc.Endpoint,
  secret_key_base: "BU2bkMeciFBkyIlK5WlCeAQzMIJVXCuWJv6Gz9r0/FXEZ009CGoFabwfXvPcEkFz"

# Configure your database
config :socket_poc, SocketPoc.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "socket_poc_prod",
  pool_size: 20
