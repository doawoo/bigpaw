defmodule Bigpaw.Repo do
  use Ecto.Repo,
    otp_app: :bigpaw,
    adapter: Ecto.Adapters.Postgres
end
