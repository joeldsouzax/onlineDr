defmodule OnlineDr.Repo do
  use Ecto.Repo,
    otp_app: :onlineDr,
    adapter: Ecto.Adapters.Postgres
end
