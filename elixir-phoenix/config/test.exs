import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hello_world_phoenix, HelloWorldPhoenixWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "226JfnS7cuqV+hBNBam00BXMpwnU4ZN2enlIysk0i4ZC76cMMEB3QFwPUgFBI8L3",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
