import Config

config :constraint_order_example, ecto_repos: [ConstraintOrderExample.Repo]

config :constraint_order_example, ConstraintOrderExample.Repo,
  database: "constraint_order_example_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"
