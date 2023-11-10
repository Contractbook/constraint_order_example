defmodule ConstraintOrderExample.Repo do
  use Ecto.Repo,
    otp_app: :constraint_order_example,
    adapter: Ecto.Adapters.Postgres
end
